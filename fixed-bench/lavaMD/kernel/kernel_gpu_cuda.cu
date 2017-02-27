//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------200
//	plasmaKernel_gpu_2
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------200

#define ASGN_OFF(tgt, src, off) \
{ \
    tgt.v = &src.v[off]; \
    tgt.x = &src.x[off]; \
    tgt.y = &src.y[off]; \
    tgt.z = &src.z[off]; \
}

#define DOT_ARR(A,ai,B,bi) ((A.x[ai])*(B.x[bi])+(A.y[ai])*(B.y[bi])+(A.z[ai])*(B.z[bi]))	// STABLE

__global__ void kernel_gpu_cuda(par_str d_par_gpu,
								dim_str d_dim_gpu,
								box_str* d_box_gpu,
								FOUR_ARR d_rv_gpu,
								fp* d_qv_gpu,
								FOUR_ARR d_fv_gpu)
{

	//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------180
	//	THREAD PARAMETERS
	//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------180

	int bx = blockIdx.x;																// get current horizontal block index (0-n)
	int tx = threadIdx.x;															// get current horizontal thread index (0-n)
	// int ax = bx*NUMBER_THREADS+tx;
	// int wbx = bx;
	int wtx = tx;

	//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------180
	//	DO FOR THE NUMBER OF BOXES
	//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------180

	if(bx<d_dim_gpu.number_boxes){
	// while(wbx<box_indexes_counter){

		//------------------------------------------------------------------------------------------------------------------------------------------------------160
		//	Extract input parameters
		//------------------------------------------------------------------------------------------------------------------------------------------------------160

		// parameters
		fp a2 = 2.0*d_par_gpu.alpha*d_par_gpu.alpha;

		// home box
		int first_i;
		FOUR_ARR rA;
		FOUR_ARR fA;
        FOUR_ARR rA_shared;

		__shared__ fp ra_shr_v[NUMBER_PAR_PER_BOX];
		__shared__ fp ra_shr_x[NUMBER_PAR_PER_BOX];
		__shared__ fp ra_shr_y[NUMBER_PAR_PER_BOX];
		__shared__ fp ra_shr_z[NUMBER_PAR_PER_BOX];
        rA_shared.v=ra_shr_v;
        rA_shared.x=ra_shr_x;
        rA_shared.y=ra_shr_y;
        rA_shared.z=ra_shr_z;

		// nei box
		int pointer;
		int k = 0;
		int first_j;
		FOUR_ARR rB;
		fp* qB;
		int j = 0;

		FOUR_ARR rB_shared;
		__shared__ fp rb_shr_v[NUMBER_PAR_PER_BOX];
		__shared__ fp rb_shr_x[NUMBER_PAR_PER_BOX];
		__shared__ fp rb_shr_y[NUMBER_PAR_PER_BOX];
		__shared__ fp rb_shr_z[NUMBER_PAR_PER_BOX];
        rB_shared.v=rb_shr_v;
        rB_shared.x=rb_shr_x;
        rB_shared.y=rb_shr_y;
        rB_shared.z=rb_shr_z;

		__shared__ double qB_shared[100];

		// common
		fp r2;
		fp u2;
		fp vij;
		fp fs;
		fp fxij;
		fp fyij;
		fp fzij;
		THREE_VECTOR d;

		//------------------------------------------------------------------------------------------------------------------------------------------------------160
		//	Home box
		//------------------------------------------------------------------------------------------------------------------------------------------------------160

		//----------------------------------------------------------------------------------------------------------------------------------140
		//	Setup parameters
		//----------------------------------------------------------------------------------------------------------------------------------140

		// home box - box parameters
		first_i = d_box_gpu[bx].offset;

		// home box - distance, force, charge and type parameters
        ASGN_OFF(rA, d_rv_gpu, first_i);
        ASGN_OFF(fA, d_fv_gpu, first_i);

		//----------------------------------------------------------------------------------------------------------------------------------140
		//	Copy to shared memory
		//----------------------------------------------------------------------------------------------------------------------------------140

		// home box - shared memory
		while(wtx<NUMBER_PAR_PER_BOX){
			rA_shared.v[wtx] = rA.v[wtx];
			rA_shared.x[wtx] = rA.x[wtx];
			rA_shared.y[wtx] = rA.y[wtx];
			rA_shared.z[wtx] = rA.z[wtx];
			wtx = wtx + NUMBER_THREADS;
		}
		wtx = tx;

		// synchronize threads  - not needed, but just to be safe
		__syncthreads();

		//------------------------------------------------------------------------------------------------------------------------------------------------------160
		//	nei box loop
		//------------------------------------------------------------------------------------------------------------------------------------------------------160

		// loop over neiing boxes of home box
		for (k=0; k<(1+d_box_gpu[bx].nn); k++){

			//----------------------------------------50
			//	nei box - get pointer to the right box
			//----------------------------------------50

			if(k==0){
				pointer = bx;													// set first box to be processed to home box
			}
			else{
				pointer = d_box_gpu[bx].nei[k-1].number;							// remaining boxes are nei boxes
			}

			//----------------------------------------------------------------------------------------------------------------------------------140
			//	Setup parameters
			//----------------------------------------------------------------------------------------------------------------------------------140

			// nei box - box parameters
			first_j = d_box_gpu[pointer].offset;

			// nei box - distance, (force), charge and (type) parameters
            ASGN_OFF(rB, d_rv_gpu, first_j);

			qB = &d_qv_gpu[first_j];

			//----------------------------------------------------------------------------------------------------------------------------------140
			//	Setup parameters
			//----------------------------------------------------------------------------------------------------------------------------------140

			// nei box - shared memory
			while(wtx<NUMBER_PAR_PER_BOX){
				rB_shared.v[wtx] = rB.v[wtx];
				rB_shared.x[wtx] = rB.x[wtx];
				rB_shared.y[wtx] = rB.y[wtx];
				rB_shared.z[wtx] = rB.z[wtx];

				qB_shared[wtx] = qB[wtx];
				wtx = wtx + NUMBER_THREADS;
			}
			wtx = tx;

			// synchronize threads because in next section each thread accesses data brought in by different threads here
			__syncthreads();

			//----------------------------------------------------------------------------------------------------------------------------------140
			//	Calculation
			//----------------------------------------------------------------------------------------------------------------------------------140

			// loop for the number of particles in the home box
			// for (int i=0; i<nTotal_i; i++){
			while(wtx<NUMBER_PAR_PER_BOX){

				// loop for the number of particles in the current nei box
				for (j=0; j<NUMBER_PAR_PER_BOX; j++){

					// r2 = rA[wtx].v + rB[j].v - DOT(rA[wtx],rB[j]);
					// u2 = a2*r2;
					// vij= exp(-u2);
					// fs = 2.*vij;

					// d.x = rA[wtx].x  - rB[j].x;
					// fxij=fs*d.x;
					// d.y = rA[wtx].y  - rB[j].y;
					// fyij=fs*d.y;
					// d.z = rA[wtx].z  - rB[j].z;
					// fzij=fs*d.z;

					// fA[wtx].v +=  qB[j]*vij;
					// fA[wtx].x +=  qB[j]*fxij;
					// fA[wtx].y +=  qB[j]*fyij;
					// fA[wtx].z +=  qB[j]*fzij;



					r2 = (rA_shared.v[wtx]) + (rB_shared.v[j])
                        - DOT_ARR(rA_shared,wtx,rB_shared,j);
					u2 = a2*r2;
					vij= exp(-u2);
					fs = 2*vij;

					d.x = (fp)rA_shared.x[wtx]  - (fp)rB_shared.x[j];
					fxij=fs*d.x;
					d.y = (fp)rA_shared.y[wtx]  - (fp)rB_shared.y[j];
					fyij=fs*d.y;
					d.z = (fp)rA_shared.z[wtx]  - (fp)rB_shared.z[j];
					fzij=fs*d.z;

					fA.v[wtx] +=  (double)((fp)qB_shared[j]*vij);
					fA.x[wtx] +=  (double)((fp)qB_shared[j]*fxij);
					fA.y[wtx] +=  (double)((fp)qB_shared[j]*fyij);
					fA.z[wtx] +=  (double)((fp)qB_shared[j]*fzij);

				}

				// increment work thread index
				wtx = wtx + NUMBER_THREADS;

			}

			// reset work index
			wtx = tx;

			// synchronize after finishing force contributions from current nei box not to cause conflicts when starting next box
			__syncthreads();

			//----------------------------------------------------------------------------------------------------------------------------------140
			//	Calculation END
			//----------------------------------------------------------------------------------------------------------------------------------140

		}

		// // increment work block index
		// wbx = wbx + NUMBER_BLOCKS;

		// // synchronize - because next iteration will overwrite current shared memory
		// __syncthreads();

		//------------------------------------------------------------------------------------------------------------------------------------------------------160
		//	nei box loop END
		//------------------------------------------------------------------------------------------------------------------------------------------------------160

	}

}
