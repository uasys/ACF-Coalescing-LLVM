; ModuleID = 'bfs.cu'
source_filename = "bfs.cu"
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.Node = type { i32, i32 }

@blockIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@threadIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1

; Function Attrs: convergent
define void @_Z6KernelP4NodePiPbS2_S2_S1_i(%struct.Node* %g_graph_nodes, i32* %g_graph_edges, i8* %g_graph_mask, i8* %g_updating_graph_mask, i8* %g_graph_visited, i32* %g_cost, i32 %no_of_nodes) #0 !dbg !451 {
entry:
  %g_graph_nodes.addr = alloca %struct.Node*, align 8
  %g_graph_edges.addr = alloca i32*, align 8
  %g_graph_mask.addr = alloca i8*, align 8
  %g_updating_graph_mask.addr = alloca i8*, align 8
  %g_graph_visited.addr = alloca i8*, align 8
  %g_cost.addr = alloca i32*, align 8
  %no_of_nodes.addr = alloca i32, align 4
  %tid = alloca i32, align 4
  %i = alloca i32, align 4
  %id = alloca i32, align 4
  store %struct.Node* %g_graph_nodes, %struct.Node** %g_graph_nodes.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Node** %g_graph_nodes.addr, metadata !461, metadata !462), !dbg !463
  store i32* %g_graph_edges, i32** %g_graph_edges.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %g_graph_edges.addr, metadata !464, metadata !462), !dbg !465
  store i8* %g_graph_mask, i8** %g_graph_mask.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %g_graph_mask.addr, metadata !466, metadata !462), !dbg !467
  store i8* %g_updating_graph_mask, i8** %g_updating_graph_mask.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %g_updating_graph_mask.addr, metadata !468, metadata !462), !dbg !469
  store i8* %g_graph_visited, i8** %g_graph_visited.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %g_graph_visited.addr, metadata !470, metadata !462), !dbg !471
  store i32* %g_cost, i32** %g_cost.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %g_cost.addr, metadata !472, metadata !462), !dbg !473
  store i32 %no_of_nodes, i32* %no_of_nodes.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %no_of_nodes.addr, metadata !474, metadata !462), !dbg !475
  call void @llvm.dbg.declare(metadata i32* %tid, metadata !476, metadata !462), !dbg !477
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2, !dbg !478, !range !515
  %mul = mul i32 %0, 512, !dbg !516
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2, !dbg !517, !range !546
  %add = add i32 %mul, %1, !dbg !547
  store i32 %add, i32* %tid, align 4, !dbg !477
  %2 = load i32, i32* %tid, align 4, !dbg !548
  %3 = load i32, i32* %no_of_nodes.addr, align 4, !dbg !550
  %cmp = icmp slt i32 %2, %3, !dbg !551
  br i1 %cmp, label %land.lhs.true, label %if.end26, !dbg !552

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %tid, align 4, !dbg !553
  %idxprom = sext i32 %4 to i64, !dbg !555
  %5 = load i8*, i8** %g_graph_mask.addr, align 8, !dbg !555
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %idxprom, !dbg !555
  %6 = load i8, i8* %arrayidx, align 1, !dbg !555
  %tobool = trunc i8 %6 to i1, !dbg !555
  br i1 %tobool, label %if.then, label %if.end26, !dbg !556

if.then:                                          ; preds = %land.lhs.true
  %7 = load i32, i32* %tid, align 4, !dbg !557
  %idxprom2 = sext i32 %7 to i64, !dbg !559
  %8 = load i8*, i8** %g_graph_mask.addr, align 8, !dbg !559
  %arrayidx3 = getelementptr inbounds i8, i8* %8, i64 %idxprom2, !dbg !559
  store i8 0, i8* %arrayidx3, align 1, !dbg !560
  call void @llvm.dbg.declare(metadata i32* %i, metadata !561, metadata !462), !dbg !563
  %9 = load i32, i32* %tid, align 4, !dbg !564
  %idxprom4 = sext i32 %9 to i64, !dbg !565
  %10 = load %struct.Node*, %struct.Node** %g_graph_nodes.addr, align 8, !dbg !565
  %arrayidx5 = getelementptr inbounds %struct.Node, %struct.Node* %10, i64 %idxprom4, !dbg !565
  %starting = getelementptr inbounds %struct.Node, %struct.Node* %arrayidx5, i32 0, i32 0, !dbg !566
  %11 = load i32, i32* %starting, align 4, !dbg !566
  store i32 %11, i32* %i, align 4, !dbg !563
  br label %for.cond, !dbg !567

for.cond:                                         ; preds = %for.inc, %if.then
  %12 = load i32, i32* %i, align 4, !dbg !568
  %13 = load i32, i32* %tid, align 4, !dbg !571
  %idxprom6 = sext i32 %13 to i64, !dbg !572
  %14 = load %struct.Node*, %struct.Node** %g_graph_nodes.addr, align 8, !dbg !572
  %arrayidx7 = getelementptr inbounds %struct.Node, %struct.Node* %14, i64 %idxprom6, !dbg !572
  %no_of_edges = getelementptr inbounds %struct.Node, %struct.Node* %arrayidx7, i32 0, i32 1, !dbg !573
  %15 = load i32, i32* %no_of_edges, align 4, !dbg !573
  %16 = load i32, i32* %tid, align 4, !dbg !574
  %idxprom8 = sext i32 %16 to i64, !dbg !575
  %17 = load %struct.Node*, %struct.Node** %g_graph_nodes.addr, align 8, !dbg !575
  %arrayidx9 = getelementptr inbounds %struct.Node, %struct.Node* %17, i64 %idxprom8, !dbg !575
  %starting10 = getelementptr inbounds %struct.Node, %struct.Node* %arrayidx9, i32 0, i32 0, !dbg !576
  %18 = load i32, i32* %starting10, align 4, !dbg !576
  %add11 = add nsw i32 %15, %18, !dbg !577
  %cmp12 = icmp slt i32 %12, %add11, !dbg !578
  br i1 %cmp12, label %for.body, label %for.end, !dbg !579

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %id, metadata !580, metadata !462), !dbg !582
  %19 = load i32, i32* %i, align 4, !dbg !583
  %idxprom13 = sext i32 %19 to i64, !dbg !584
  %20 = load i32*, i32** %g_graph_edges.addr, align 8, !dbg !584
  %arrayidx14 = getelementptr inbounds i32, i32* %20, i64 %idxprom13, !dbg !584
  %21 = load i32, i32* %arrayidx14, align 4, !dbg !584
  store i32 %21, i32* %id, align 4, !dbg !582
  %22 = load i32, i32* %id, align 4, !dbg !585
  %idxprom15 = sext i32 %22 to i64, !dbg !587
  %23 = load i8*, i8** %g_graph_visited.addr, align 8, !dbg !587
  %arrayidx16 = getelementptr inbounds i8, i8* %23, i64 %idxprom15, !dbg !587
  %24 = load i8, i8* %arrayidx16, align 1, !dbg !587
  %tobool17 = trunc i8 %24 to i1, !dbg !587
  br i1 %tobool17, label %if.end, label %if.then18, !dbg !588

if.then18:                                        ; preds = %for.body
  %25 = load i32, i32* %tid, align 4, !dbg !589
  %idxprom19 = sext i32 %25 to i64, !dbg !591
  %26 = load i32*, i32** %g_cost.addr, align 8, !dbg !591
  %arrayidx20 = getelementptr inbounds i32, i32* %26, i64 %idxprom19, !dbg !591
  %27 = load i32, i32* %arrayidx20, align 4, !dbg !591
  %add21 = add nsw i32 %27, 1, !dbg !592
  %28 = load i32, i32* %id, align 4, !dbg !593
  %idxprom22 = sext i32 %28 to i64, !dbg !594
  %29 = load i32*, i32** %g_cost.addr, align 8, !dbg !594
  %arrayidx23 = getelementptr inbounds i32, i32* %29, i64 %idxprom22, !dbg !594
  store i32 %add21, i32* %arrayidx23, align 4, !dbg !595
  %30 = load i32, i32* %id, align 4, !dbg !596
  %idxprom24 = sext i32 %30 to i64, !dbg !597
  %31 = load i8*, i8** %g_updating_graph_mask.addr, align 8, !dbg !597
  %arrayidx25 = getelementptr inbounds i8, i8* %31, i64 %idxprom24, !dbg !597
  store i8 1, i8* %arrayidx25, align 1, !dbg !598
  br label %if.end, !dbg !599

if.end:                                           ; preds = %if.then18, %for.body
  br label %for.inc, !dbg !600

for.inc:                                          ; preds = %if.end
  %32 = load i32, i32* %i, align 4, !dbg !601
  %inc = add nsw i32 %32, 1, !dbg !601
  store i32 %inc, i32* %i, align 4, !dbg !601
  br label %for.cond, !dbg !603, !llvm.loop !604

for.end:                                          ; preds = %for.cond
  br label %if.end26, !dbg !606

if.end26:                                         ; preds = %for.end, %land.lhs.true, %entry
  ret void, !dbg !607
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: convergent
define void @_Z7Kernel2PbS_S_S_i(i8* %g_graph_mask, i8* %g_updating_graph_mask, i8* %g_graph_visited, i8* %g_over, i32 %no_of_nodes) #0 !dbg !608 {
entry:
  %g_graph_mask.addr = alloca i8*, align 8
  %g_updating_graph_mask.addr = alloca i8*, align 8
  %g_graph_visited.addr = alloca i8*, align 8
  %g_over.addr = alloca i8*, align 8
  %no_of_nodes.addr = alloca i32, align 4
  %tid = alloca i32, align 4
  store i8* %g_graph_mask, i8** %g_graph_mask.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %g_graph_mask.addr, metadata !612, metadata !462), !dbg !613
  store i8* %g_updating_graph_mask, i8** %g_updating_graph_mask.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %g_updating_graph_mask.addr, metadata !614, metadata !462), !dbg !615
  store i8* %g_graph_visited, i8** %g_graph_visited.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %g_graph_visited.addr, metadata !616, metadata !462), !dbg !617
  store i8* %g_over, i8** %g_over.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %g_over.addr, metadata !618, metadata !462), !dbg !619
  store i32 %no_of_nodes, i32* %no_of_nodes.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %no_of_nodes.addr, metadata !620, metadata !462), !dbg !621
  call void @llvm.dbg.declare(metadata i32* %tid, metadata !622, metadata !462), !dbg !623
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2, !dbg !624, !range !515
  %mul = mul i32 %0, 512, !dbg !626
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2, !dbg !627, !range !546
  %add = add i32 %mul, %1, !dbg !630
  store i32 %add, i32* %tid, align 4, !dbg !623
  %2 = load i32, i32* %tid, align 4, !dbg !631
  %3 = load i32, i32* %no_of_nodes.addr, align 4, !dbg !633
  %cmp = icmp slt i32 %2, %3, !dbg !634
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !635

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %tid, align 4, !dbg !636
  %idxprom = sext i32 %4 to i64, !dbg !638
  %5 = load i8*, i8** %g_updating_graph_mask.addr, align 8, !dbg !638
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %idxprom, !dbg !638
  %6 = load i8, i8* %arrayidx, align 1, !dbg !638
  %tobool = trunc i8 %6 to i1, !dbg !638
  br i1 %tobool, label %if.then, label %if.end, !dbg !639

if.then:                                          ; preds = %land.lhs.true
  %7 = load i32, i32* %tid, align 4, !dbg !640
  %idxprom2 = sext i32 %7 to i64, !dbg !642
  %8 = load i8*, i8** %g_graph_mask.addr, align 8, !dbg !642
  %arrayidx3 = getelementptr inbounds i8, i8* %8, i64 %idxprom2, !dbg !642
  store i8 1, i8* %arrayidx3, align 1, !dbg !643
  %9 = load i32, i32* %tid, align 4, !dbg !644
  %idxprom4 = sext i32 %9 to i64, !dbg !645
  %10 = load i8*, i8** %g_graph_visited.addr, align 8, !dbg !645
  %arrayidx5 = getelementptr inbounds i8, i8* %10, i64 %idxprom4, !dbg !645
  store i8 1, i8* %arrayidx5, align 1, !dbg !646
  %11 = load i8*, i8** %g_over.addr, align 8, !dbg !647
  store i8 1, i8* %11, align 1, !dbg !648
  %12 = load i32, i32* %tid, align 4, !dbg !649
  %idxprom6 = sext i32 %12 to i64, !dbg !650
  %13 = load i8*, i8** %g_updating_graph_mask.addr, align 8, !dbg !650
  %arrayidx7 = getelementptr inbounds i8, i8* %13, i64 %idxprom6, !dbg !650
  store i8 0, i8* %arrayidx7, align 1, !dbg !651
  br label %if.end, !dbg !652

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void, !dbg !653
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { convergent "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!0}
!nvvm.annotations = !{!440, !441, !442, !443, !442, !444, !444, !444, !444, !445, !445, !444}
!llvm.module.flags = !{!446, !447, !448}
!llvm.ident = !{!449}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!450}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 4.0.0 (git@github.com:taylorlloyd/coalescingsa-clang.git 0c0654cbe42ce8060cf9bfeea18254aa37aceca3) (http://llvm.org/git/llvm.git 008f70d21cc2b33cebd1d4443052e62d3fbea6e8)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, imports: !3)
!1 = !DIFile(filename: "bfs.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!2 = !{}
!3 = !{!4, !11, !16, !18, !20, !22, !24, !28, !30, !32, !34, !36, !38, !40, !42, !44, !46, !48, !50, !52, !54, !56, !60, !62, !64, !66, !71, !76, !78, !80, !85, !89, !91, !93, !95, !97, !99, !101, !103, !105, !110, !114, !116, !118, !122, !124, !126, !128, !130, !132, !136, !138, !143, !151, !155, !157, !159, !161, !163, !165, !169, !171, !173, !177, !179, !181, !183, !185, !187, !189, !191, !193, !195, !200, !202, !204, !208, !210, !212, !214, !216, !218, !220, !222, !226, !230, !232, !234, !239, !241, !243, !245, !247, !249, !251, !255, !261, !265, !269, !274, !276, !280, !284, !298, !302, !306, !310, !314, !319, !321, !325, !329, !333, !341, !345, !349, !353, !357, !362, !368, !372, !376, !378, !386, !390, !398, !400, !402, !406, !410, !414, !419, !423, !428, !429, !430, !431, !434, !435, !436, !437, !438, !439}
!4 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !7, line: 187)
!5 = !DINamespace(name: "std", scope: null, file: !6, line: 186)
!6 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!7 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !6, file: !6, line: 44, type: !8, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10}
!10 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!11 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !12, line: 188)
!12 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !6, file: !6, line: 46, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!13 = !DISubroutineType(types: !14)
!14 = !{!15, !15}
!15 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!16 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !17, line: 189)
!17 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !6, file: !6, line: 48, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!18 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !19, line: 190)
!19 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !6, file: !6, line: 50, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!20 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !21, line: 191)
!21 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !6, file: !6, line: 52, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!22 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !23, line: 192)
!23 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !6, file: !6, line: 56, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!24 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !25, line: 193)
!25 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !6, file: !6, line: 54, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!26 = !DISubroutineType(types: !27)
!27 = !{!15, !15, !15}
!28 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !29, line: 194)
!29 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !6, file: !6, line: 58, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!30 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !31, line: 195)
!31 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !6, file: !6, line: 60, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!32 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !33, line: 196)
!33 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !6, file: !6, line: 62, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!34 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !35, line: 197)
!35 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !6, file: !6, line: 64, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!36 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !37, line: 198)
!37 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !6, file: !6, line: 66, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!38 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !39, line: 199)
!39 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !6, file: !6, line: 68, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!40 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !41, line: 200)
!41 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !6, file: !6, line: 72, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!42 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !43, line: 201)
!43 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !6, file: !6, line: 70, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!44 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !45, line: 202)
!45 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !6, file: !6, line: 76, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!46 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !47, line: 203)
!47 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !6, file: !6, line: 74, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!48 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !49, line: 204)
!49 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !6, file: !6, line: 78, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!50 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !51, line: 205)
!51 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !6, file: !6, line: 80, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!52 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !53, line: 206)
!53 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !6, file: !6, line: 82, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!54 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !55, line: 207)
!55 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !6, file: !6, line: 84, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!56 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !57, line: 208)
!57 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !6, file: !6, line: 86, type: !58, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!58 = !DISubroutineType(types: !59)
!59 = !{!15, !15, !15, !15}
!60 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !61, line: 209)
!61 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !6, file: !6, line: 88, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!62 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !63, line: 210)
!63 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !6, file: !6, line: 90, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!64 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !65, line: 211)
!65 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !6, file: !6, line: 92, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!66 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !67, line: 212)
!67 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !6, file: !6, line: 94, type: !68, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!68 = !DISubroutineType(types: !69)
!69 = !{!70, !15}
!70 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!71 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !72, line: 213)
!72 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !6, file: !6, line: 96, type: !73, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!73 = !DISubroutineType(types: !74)
!74 = !{!15, !15, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64, align: 64)
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !77, line: 214)
!77 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !6, file: !6, line: 98, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !79, line: 215)
!79 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !6, file: !6, line: 100, type: !68, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !81, line: 216)
!81 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !6, file: !6, line: 102, type: !82, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!82 = !DISubroutineType(types: !83)
!83 = !{!84, !15}
!84 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!85 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !86, line: 217)
!86 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !6, file: !6, line: 106, type: !87, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!87 = !DISubroutineType(types: !88)
!88 = !{!84, !15, !15}
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !90, line: 218)
!90 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !6, file: !6, line: 105, type: !87, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!91 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !92, line: 219)
!92 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !6, file: !6, line: 108, type: !82, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!93 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !94, line: 220)
!94 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !6, file: !6, line: 112, type: !87, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!95 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !96, line: 221)
!96 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !6, file: !6, line: 111, type: !87, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!97 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !98, line: 222)
!98 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !6, file: !6, line: 114, type: !87, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!99 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !100, line: 223)
!100 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !6, file: !6, line: 116, type: !82, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !102, line: 224)
!102 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !6, file: !6, line: 118, type: !82, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !104, line: 225)
!104 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !6, file: !6, line: 120, type: !87, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !106, line: 226)
!106 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !6, file: !6, line: 121, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!107 = !DISubroutineType(types: !108)
!108 = !{!109, !109}
!109 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !111, line: 227)
!111 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !6, file: !6, line: 123, type: !112, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!112 = !DISubroutineType(types: !113)
!113 = !{!15, !15, !70}
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !115, line: 228)
!115 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !6, file: !6, line: 125, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !117, line: 229)
!117 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !6, file: !6, line: 126, type: !8, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !119, line: 230)
!119 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !6, file: !6, line: 128, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!120 = !DISubroutineType(types: !121)
!121 = !{!10, !15}
!122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !123, line: 231)
!123 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !6, file: !6, line: 138, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !125, line: 232)
!125 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !6, file: !6, line: 130, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !127, line: 233)
!127 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !6, file: !6, line: 132, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !129, line: 234)
!129 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !6, file: !6, line: 134, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !131, line: 235)
!131 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !6, file: !6, line: 136, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !133, line: 236)
!133 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !6, file: !6, line: 140, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!134 = !DISubroutineType(types: !135)
!135 = !{!109, !15}
!136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !137, line: 237)
!137 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !6, file: !6, line: 142, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !139, line: 238)
!139 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !6, file: !6, line: 144, type: !140, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!140 = !DISubroutineType(types: !141)
!141 = !{!15, !15, !142}
!142 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64, align: 64)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !144, line: 239)
!144 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !6, file: !6, line: 145, type: !145, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!145 = !DISubroutineType(types: !146)
!146 = !{!147, !148}
!147 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!148 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !149, size: 64, align: 64)
!149 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !150)
!150 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !152, line: 240)
!152 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !6, file: !6, line: 146, type: !153, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!153 = !DISubroutineType(types: !154)
!154 = !{!15, !148}
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !156, line: 241)
!156 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !6, file: !6, line: 148, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !158, line: 242)
!158 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !6, file: !6, line: 150, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !160, line: 243)
!160 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardff", scope: !6, file: !6, line: 152, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !162, line: 244)
!162 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !6, file: !6, line: 156, type: !112, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !164, line: 245)
!164 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !6, file: !6, line: 158, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !166, line: 246)
!166 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !6, file: !6, line: 160, type: !167, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!167 = !DISubroutineType(types: !168)
!168 = !{!15, !15, !15, !75}
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !170, line: 247)
!170 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !6, file: !6, line: 162, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !172, line: 248)
!172 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !6, file: !6, line: 164, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !174, line: 249)
!174 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !6, file: !6, line: 166, type: !175, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!175 = !DISubroutineType(types: !176)
!176 = !{!15, !15, !109}
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !178, line: 250)
!178 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !6, file: !6, line: 168, type: !112, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !180, line: 251)
!180 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !6, file: !6, line: 170, type: !82, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !182, line: 252)
!182 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !6, file: !6, line: 172, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !184, line: 253)
!184 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !6, file: !6, line: 174, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !186, line: 254)
!186 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !6, file: !6, line: 176, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !188, line: 255)
!188 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !6, file: !6, line: 178, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !190, line: 256)
!190 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !6, file: !6, line: 180, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !192, line: 257)
!192 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !6, file: !6, line: 182, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !194, line: 258)
!194 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !6, file: !6, line: 184, type: !13, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !196, line: 102)
!196 = !DISubprogram(name: "acos", scope: !197, file: !197, line: 54, type: !198, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!197 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!198 = !DISubroutineType(types: !199)
!199 = !{!147, !147}
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !201, line: 121)
!201 = !DISubprogram(name: "asin", scope: !197, file: !197, line: 56, type: !198, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !203, line: 140)
!203 = !DISubprogram(name: "atan", scope: !197, file: !197, line: 58, type: !198, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !205, line: 159)
!205 = !DISubprogram(name: "atan2", scope: !197, file: !197, line: 60, type: !206, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!206 = !DISubroutineType(types: !207)
!207 = !{!147, !147, !147}
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !209, line: 180)
!209 = !DISubprogram(name: "ceil", scope: !197, file: !197, line: 178, type: !198, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !211, line: 199)
!211 = !DISubprogram(name: "cos", scope: !197, file: !197, line: 63, type: !198, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !213, line: 218)
!213 = !DISubprogram(name: "cosh", scope: !197, file: !197, line: 72, type: !198, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !215, line: 237)
!215 = !DISubprogram(name: "exp", scope: !197, file: !197, line: 100, type: !198, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !217, line: 256)
!217 = !DISubprogram(name: "fabs", scope: !197, file: !197, line: 181, type: !198, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !219, line: 275)
!219 = !DISubprogram(name: "floor", scope: !197, file: !197, line: 184, type: !198, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !221, line: 294)
!221 = !DISubprogram(name: "fmod", scope: !197, file: !197, line: 187, type: !206, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !223, line: 315)
!223 = !DISubprogram(name: "frexp", scope: !197, file: !197, line: 103, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!224 = !DISubroutineType(types: !225)
!225 = !{!147, !147, !75}
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !227, line: 334)
!227 = !DISubprogram(name: "ldexp", scope: !197, file: !197, line: 106, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!228 = !DISubroutineType(types: !229)
!229 = !{!147, !147, !70}
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !231, line: 353)
!231 = !DISubprogram(name: "log", scope: !197, file: !197, line: 109, type: !198, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !233, line: 372)
!233 = !DISubprogram(name: "log10", scope: !197, file: !197, line: 112, type: !198, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !235, line: 391)
!235 = !DISubprogram(name: "modf", scope: !197, file: !197, line: 115, type: !236, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!236 = !DISubroutineType(types: !237)
!237 = !{!147, !147, !238}
!238 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !147, size: 64, align: 64)
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !240, line: 403)
!240 = !DISubprogram(name: "pow", scope: !197, file: !197, line: 153, type: !206, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !242, line: 440)
!242 = !DISubprogram(name: "sin", scope: !197, file: !197, line: 65, type: !198, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !244, line: 459)
!244 = !DISubprogram(name: "sinh", scope: !197, file: !197, line: 74, type: !198, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !246, line: 478)
!246 = !DISubprogram(name: "sqrt", scope: !197, file: !197, line: 156, type: !198, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !248, line: 497)
!248 = !DISubprogram(name: "tan", scope: !197, file: !197, line: 67, type: !198, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !250, line: 516)
!250 = !DISubprogram(name: "tanh", scope: !197, file: !197, line: 76, type: !198, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !252, line: 118)
!252 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !253, line: 101, baseType: !254)
!253 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!254 = !DICompositeType(tag: DW_TAG_structure_type, file: !253, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !256, line: 119)
!256 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !253, line: 109, baseType: !257)
!257 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !253, line: 105, size: 128, align: 64, elements: !258, identifier: "_ZTS6ldiv_t")
!258 = !{!259, !260}
!259 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !257, file: !253, line: 107, baseType: !109, size: 64, align: 64)
!260 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !257, file: !253, line: 108, baseType: !109, size: 64, align: 64, offset: 64)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !262, line: 121)
!262 = !DISubprogram(name: "abort", scope: !253, file: !253, line: 515, type: !263, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!263 = !DISubroutineType(types: !264)
!264 = !{null}
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !266, line: 122)
!266 = !DISubprogram(name: "abs", scope: !253, file: !253, line: 774, type: !267, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!267 = !DISubroutineType(types: !268)
!268 = !{!70, !70}
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !270, line: 123)
!270 = !DISubprogram(name: "atexit", scope: !253, file: !253, line: 519, type: !271, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!271 = !DISubroutineType(types: !272)
!272 = !{!70, !273}
!273 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !263, size: 64, align: 64)
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !275, line: 129)
!275 = !DISubprogram(name: "atof", scope: !253, file: !253, line: 144, type: !145, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !277, line: 130)
!277 = !DISubprogram(name: "atoi", scope: !253, file: !253, line: 147, type: !278, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!278 = !DISubroutineType(types: !279)
!279 = !{!70, !148}
!280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !281, line: 131)
!281 = !DISubprogram(name: "atol", scope: !253, file: !253, line: 150, type: !282, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!282 = !DISubroutineType(types: !283)
!283 = !{!109, !148}
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !285, line: 132)
!285 = !DISubprogram(name: "bsearch", scope: !253, file: !253, line: 754, type: !286, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!286 = !DISubroutineType(types: !287)
!287 = !{!288, !289, !289, !291, !291, !294}
!288 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!289 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !290, size: 64, align: 64)
!290 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!291 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !292, line: 62, baseType: !293)
!292 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!293 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!294 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !253, line: 741, baseType: !295)
!295 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !296, size: 64, align: 64)
!296 = !DISubroutineType(types: !297)
!297 = !{!70, !289, !289}
!298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !299, line: 133)
!299 = !DISubprogram(name: "calloc", scope: !253, file: !253, line: 468, type: !300, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!300 = !DISubroutineType(types: !301)
!301 = !{!288, !291, !291}
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !303, line: 134)
!303 = !DISubprogram(name: "div", scope: !253, file: !253, line: 788, type: !304, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!304 = !DISubroutineType(types: !305)
!305 = !{!252, !70, !70}
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !307, line: 135)
!307 = !DISubprogram(name: "exit", scope: !253, file: !253, line: 543, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!308 = !DISubroutineType(types: !309)
!309 = !{null, !70}
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !311, line: 136)
!311 = !DISubprogram(name: "free", scope: !253, file: !253, line: 483, type: !312, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!312 = !DISubroutineType(types: !313)
!313 = !{null, !288}
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !315, line: 137)
!315 = !DISubprogram(name: "getenv", scope: !253, file: !253, line: 564, type: !316, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!316 = !DISubroutineType(types: !317)
!317 = !{!318, !148}
!318 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !150, size: 64, align: 64)
!319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !320, line: 138)
!320 = !DISubprogram(name: "labs", scope: !253, file: !253, line: 775, type: !107, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !322, line: 139)
!322 = !DISubprogram(name: "ldiv", scope: !253, file: !253, line: 790, type: !323, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!323 = !DISubroutineType(types: !324)
!324 = !{!256, !109, !109}
!325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !326, line: 140)
!326 = !DISubprogram(name: "malloc", scope: !253, file: !253, line: 466, type: !327, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!327 = !DISubroutineType(types: !328)
!328 = !{!288, !291}
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !330, line: 142)
!330 = !DISubprogram(name: "mblen", scope: !253, file: !253, line: 862, type: !331, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!331 = !DISubroutineType(types: !332)
!332 = !{!70, !148, !291}
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !334, line: 143)
!334 = !DISubprogram(name: "mbstowcs", scope: !253, file: !253, line: 873, type: !335, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!335 = !DISubroutineType(types: !336)
!336 = !{!291, !337, !340, !291}
!337 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !338)
!338 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !339, size: 64, align: 64)
!339 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!340 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !148)
!341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !342, line: 144)
!342 = !DISubprogram(name: "mbtowc", scope: !253, file: !253, line: 865, type: !343, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!343 = !DISubroutineType(types: !344)
!344 = !{!70, !337, !340, !291}
!345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !346, line: 146)
!346 = !DISubprogram(name: "qsort", scope: !253, file: !253, line: 764, type: !347, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!347 = !DISubroutineType(types: !348)
!348 = !{null, !288, !291, !291, !294}
!349 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !350, line: 152)
!350 = !DISubprogram(name: "rand", scope: !253, file: !253, line: 374, type: !351, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!351 = !DISubroutineType(types: !352)
!352 = !{!70}
!353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !354, line: 153)
!354 = !DISubprogram(name: "realloc", scope: !253, file: !253, line: 480, type: !355, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!355 = !DISubroutineType(types: !356)
!356 = !{!288, !288, !291}
!357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !358, line: 154)
!358 = !DISubprogram(name: "srand", scope: !253, file: !253, line: 376, type: !359, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!359 = !DISubroutineType(types: !360)
!360 = !{null, !361}
!361 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !363, line: 155)
!363 = !DISubprogram(name: "strtod", scope: !253, file: !253, line: 164, type: !364, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!364 = !DISubroutineType(types: !365)
!365 = !{!147, !340, !366}
!366 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !367)
!367 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !318, size: 64, align: 64)
!368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !369, line: 156)
!369 = !DISubprogram(name: "strtol", scope: !253, file: !253, line: 183, type: !370, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!370 = !DISubroutineType(types: !371)
!371 = !{!109, !340, !366, !70}
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !373, line: 157)
!373 = !DISubprogram(name: "strtoul", scope: !253, file: !253, line: 187, type: !374, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!374 = !DISubroutineType(types: !375)
!375 = !{!293, !340, !366, !70}
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !377, line: 158)
!377 = !DISubprogram(name: "system", scope: !253, file: !253, line: 716, type: !278, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !379, line: 160)
!379 = !DISubprogram(name: "wcstombs", scope: !253, file: !253, line: 876, type: !380, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!380 = !DISubroutineType(types: !381)
!381 = !{!291, !382, !383, !291}
!382 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !318)
!383 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !384)
!384 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !385, size: 64, align: 64)
!385 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !339)
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !387, line: 161)
!387 = !DISubprogram(name: "wctomb", scope: !253, file: !253, line: 869, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!388 = !DISubroutineType(types: !389)
!389 = !{!70, !318, !339}
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !391, entity: !393, line: 214)
!391 = !DINamespace(name: "__gnu_cxx", scope: null, file: !392, line: 220)
!392 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!393 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !253, line: 121, baseType: !394)
!394 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !253, line: 117, size: 128, align: 64, elements: !395, identifier: "_ZTS7lldiv_t")
!395 = !{!396, !397}
!396 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !394, file: !253, line: 119, baseType: !10, size: 64, align: 64)
!397 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !394, file: !253, line: 120, baseType: !10, size: 64, align: 64, offset: 64)
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !391, entity: !399, line: 220)
!399 = !DISubprogram(name: "_Exit", scope: !253, file: !253, line: 557, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !391, entity: !401, line: 224)
!401 = !DISubprogram(name: "llabs", scope: !253, file: !253, line: 779, type: !8, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !391, entity: !403, line: 230)
!403 = !DISubprogram(name: "lldiv", scope: !253, file: !253, line: 796, type: !404, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!404 = !DISubroutineType(types: !405)
!405 = !{!393, !10, !10}
!406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !391, entity: !407, line: 241)
!407 = !DISubprogram(name: "atoll", scope: !253, file: !253, line: 157, type: !408, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!408 = !DISubroutineType(types: !409)
!409 = !{!10, !148}
!410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !391, entity: !411, line: 242)
!411 = !DISubprogram(name: "strtoll", scope: !253, file: !253, line: 209, type: !412, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!412 = !DISubroutineType(types: !413)
!413 = !{!10, !340, !366, !70}
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !391, entity: !415, line: 243)
!415 = !DISubprogram(name: "strtoull", scope: !253, file: !253, line: 214, type: !416, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!416 = !DISubroutineType(types: !417)
!417 = !{!418, !340, !366, !70}
!418 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !391, entity: !420, line: 245)
!420 = !DISubprogram(name: "strtof", scope: !253, file: !253, line: 172, type: !421, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!421 = !DISubroutineType(types: !422)
!422 = !{!15, !340, !366}
!423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !391, entity: !424, line: 246)
!424 = !DISubprogram(name: "strtold", scope: !253, file: !253, line: 175, type: !425, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!425 = !DISubroutineType(types: !426)
!426 = !{!427, !340, !366}
!427 = !DIBasicType(name: "long double", size: 64, align: 64, encoding: DW_ATE_float)
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !393, line: 254)
!429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !399, line: 256)
!430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !401, line: 258)
!431 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !432, line: 259)
!432 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !391, file: !433, line: 227, type: !404, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!433 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !403, line: 260)
!435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !407, line: 262)
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !420, line: 263)
!437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !411, line: 264)
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !415, line: 265)
!439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !5, entity: !424, line: 266)
!440 = !{void (%struct.Node*, i32*, i8*, i8*, i8*, i32*, i32)* @_Z6KernelP4NodePiPbS2_S2_S1_i, !"kernel", i32 1}
!441 = !{void (i8*, i8*, i8*, i8*, i32)* @_Z7Kernel2PbS_S_S_i, !"kernel", i32 1}
!442 = !{null, !"align", i32 8}
!443 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!444 = !{null, !"align", i32 16}
!445 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!446 = !{i32 2, !"Dwarf Version", i32 4}
!447 = !{i32 2, !"Debug Info Version", i32 3}
!448 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!449 = !{!"clang version 4.0.0 (git@github.com:taylorlloyd/coalescingsa-clang.git 0c0654cbe42ce8060cf9bfeea18254aa37aceca3) (http://llvm.org/git/llvm.git 008f70d21cc2b33cebd1d4443052e62d3fbea6e8)"}
!450 = !{i32 1, i32 2}
!451 = distinct !DISubprogram(name: "Kernel", linkageName: "_Z6KernelP4NodePiPbS2_S2_S1_i", scope: !452, file: !452, line: 22, type: !453, isLocal: false, isDefinition: true, scopeLine: 23, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!452 = !DIFile(filename: "./kernel.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!453 = !DISubroutineType(types: !454)
!454 = !{null, !455, !75, !460, !460, !460, !75, !70}
!455 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !456, size: 64, align: 64)
!456 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Node", file: !1, line: 31, size: 64, align: 32, elements: !457, identifier: "_ZTS4Node")
!457 = !{!458, !459}
!458 = !DIDerivedType(tag: DW_TAG_member, name: "starting", scope: !456, file: !1, line: 33, baseType: !70, size: 32, align: 32)
!459 = !DIDerivedType(tag: DW_TAG_member, name: "no_of_edges", scope: !456, file: !1, line: 34, baseType: !70, size: 32, align: 32, offset: 32)
!460 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64, align: 64)
!461 = !DILocalVariable(name: "g_graph_nodes", arg: 1, scope: !451, file: !452, line: 22, type: !455)
!462 = !DIExpression()
!463 = !DILocation(line: 22, column: 15, scope: !451)
!464 = !DILocalVariable(name: "g_graph_edges", arg: 2, scope: !451, file: !452, line: 22, type: !75)
!465 = !DILocation(line: 22, column: 35, scope: !451)
!466 = !DILocalVariable(name: "g_graph_mask", arg: 3, scope: !451, file: !452, line: 22, type: !460)
!467 = !DILocation(line: 22, column: 56, scope: !451)
!468 = !DILocalVariable(name: "g_updating_graph_mask", arg: 4, scope: !451, file: !452, line: 22, type: !460)
!469 = !DILocation(line: 22, column: 76, scope: !451)
!470 = !DILocalVariable(name: "g_graph_visited", arg: 5, scope: !451, file: !452, line: 22, type: !460)
!471 = !DILocation(line: 22, column: 105, scope: !451)
!472 = !DILocalVariable(name: "g_cost", arg: 6, scope: !451, file: !452, line: 22, type: !75)
!473 = !DILocation(line: 22, column: 127, scope: !451)
!474 = !DILocalVariable(name: "no_of_nodes", arg: 7, scope: !451, file: !452, line: 22, type: !70)
!475 = !DILocation(line: 22, column: 139, scope: !451)
!476 = !DILocalVariable(name: "tid", scope: !451, file: !452, line: 24, type: !70)
!477 = !DILocation(line: 24, column: 6, scope: !451)
!478 = !DILocation(line: 78, column: 3, scope: !479, inlinedAt: !514)
!479 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !481, file: !480, line: 78, type: !484, isLocal: false, isDefinition: true, scopeLine: 78, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !483, variables: !2)
!480 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/cuda_builtin_vars.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!481 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_blockIdx_t", file: !480, line: 77, size: 8, align: 8, elements: !482, identifier: "_ZTS25__cuda_builtin_blockIdx_t")
!482 = !{!483, !486, !487, !488, !499, !503, !507, !510}
!483 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !481, file: !480, line: 78, type: !484, isLocal: false, isDefinition: false, scopeLine: 78, flags: DIFlagPrototyped, isOptimized: false)
!484 = !DISubroutineType(types: !485)
!485 = !{!361}
!486 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv", scope: !481, file: !480, line: 79, type: !484, isLocal: false, isDefinition: false, scopeLine: 79, flags: DIFlagPrototyped, isOptimized: false)
!487 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_zEv", scope: !481, file: !480, line: 80, type: !484, isLocal: false, isDefinition: false, scopeLine: 80, flags: DIFlagPrototyped, isOptimized: false)
!488 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK25__cuda_builtin_blockIdx_tcv5uint3Ev", scope: !481, file: !480, line: 83, type: !489, isLocal: false, isDefinition: false, scopeLine: 83, flags: DIFlagPrototyped, isOptimized: false)
!489 = !DISubroutineType(types: !490)
!490 = !{!491, !497}
!491 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !492, line: 190, size: 96, align: 32, elements: !493, identifier: "_ZTS5uint3")
!492 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!493 = !{!494, !495, !496}
!494 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !491, file: !492, line: 192, baseType: !361, size: 32, align: 32)
!495 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !491, file: !492, line: 192, baseType: !361, size: 32, align: 32, offset: 32)
!496 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !491, file: !492, line: 192, baseType: !361, size: 32, align: 32, offset: 64)
!497 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !498, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!498 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !481)
!499 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !481, file: !480, line: 85, type: !500, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!500 = !DISubroutineType(types: !501)
!501 = !{null, !502}
!502 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !481, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!503 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !481, file: !480, line: 85, type: !504, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!504 = !DISubroutineType(types: !505)
!505 = !{null, !502, !506}
!506 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !498, size: 64, align: 64)
!507 = !DISubprogram(name: "operator=", linkageName: "_ZNK25__cuda_builtin_blockIdx_taSERKS_", scope: !481, file: !480, line: 85, type: !508, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!508 = !DISubroutineType(types: !509)
!509 = !{null, !497, !506}
!510 = !DISubprogram(name: "operator&", linkageName: "_ZNK25__cuda_builtin_blockIdx_tadEv", scope: !481, file: !480, line: 85, type: !511, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!511 = !DISubroutineType(types: !512)
!512 = !{!513, !497}
!513 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !481, size: 64, align: 64)
!514 = distinct !DILocation(line: 24, column: 12, scope: !451)
!515 = !{i32 0, i32 65535}
!516 = !DILocation(line: 24, column: 22, scope: !451)
!517 = !DILocation(line: 67, column: 3, scope: !518, inlinedAt: !544)
!518 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !519, file: !480, line: 67, type: !484, isLocal: false, isDefinition: true, scopeLine: 67, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !521, variables: !2)
!519 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_threadIdx_t", file: !480, line: 66, size: 8, align: 8, elements: !520, identifier: "_ZTS26__cuda_builtin_threadIdx_t")
!520 = !{!521, !522, !523, !524, !529, !533, !537, !540}
!521 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !519, file: !480, line: 67, type: !484, isLocal: false, isDefinition: false, scopeLine: 67, flags: DIFlagPrototyped, isOptimized: false)
!522 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv", scope: !519, file: !480, line: 68, type: !484, isLocal: false, isDefinition: false, scopeLine: 68, flags: DIFlagPrototyped, isOptimized: false)
!523 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_zEv", scope: !519, file: !480, line: 69, type: !484, isLocal: false, isDefinition: false, scopeLine: 69, flags: DIFlagPrototyped, isOptimized: false)
!524 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK26__cuda_builtin_threadIdx_tcv5uint3Ev", scope: !519, file: !480, line: 72, type: !525, isLocal: false, isDefinition: false, scopeLine: 72, flags: DIFlagPrototyped, isOptimized: false)
!525 = !DISubroutineType(types: !526)
!526 = !{!491, !527}
!527 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !528, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!528 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !519)
!529 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !519, file: !480, line: 74, type: !530, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!530 = !DISubroutineType(types: !531)
!531 = !{null, !532}
!532 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !519, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!533 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !519, file: !480, line: 74, type: !534, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!534 = !DISubroutineType(types: !535)
!535 = !{null, !532, !536}
!536 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !528, size: 64, align: 64)
!537 = !DISubprogram(name: "operator=", linkageName: "_ZNK26__cuda_builtin_threadIdx_taSERKS_", scope: !519, file: !480, line: 74, type: !538, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!538 = !DISubroutineType(types: !539)
!539 = !{null, !527, !536}
!540 = !DISubprogram(name: "operator&", linkageName: "_ZNK26__cuda_builtin_threadIdx_tadEv", scope: !519, file: !480, line: 74, type: !541, isLocal: false, isDefinition: false, scopeLine: 74, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!541 = !DISubroutineType(types: !542)
!542 = !{!543, !527}
!543 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !519, size: 64, align: 64)
!544 = distinct !DILocation(line: 24, column: 47, scope: !545)
!545 = !DILexicalBlockFile(scope: !451, file: !452, discriminator: 1)
!546 = !{i32 0, i32 1024}
!547 = !DILocation(line: 24, column: 45, scope: !451)
!548 = !DILocation(line: 25, column: 6, scope: !549)
!549 = distinct !DILexicalBlock(scope: !451, file: !452, line: 25, column: 6)
!550 = !DILocation(line: 25, column: 10, scope: !549)
!551 = !DILocation(line: 25, column: 9, scope: !549)
!552 = !DILocation(line: 25, column: 22, scope: !549)
!553 = !DILocation(line: 25, column: 38, scope: !554)
!554 = !DILexicalBlockFile(scope: !549, file: !452, discriminator: 1)
!555 = !DILocation(line: 25, column: 25, scope: !554)
!556 = !DILocation(line: 25, column: 6, scope: !554)
!557 = !DILocation(line: 27, column: 16, scope: !558)
!558 = distinct !DILexicalBlock(scope: !549, file: !452, line: 26, column: 2)
!559 = !DILocation(line: 27, column: 3, scope: !558)
!560 = !DILocation(line: 27, column: 20, scope: !558)
!561 = !DILocalVariable(name: "i", scope: !562, file: !452, line: 28, type: !70)
!562 = distinct !DILexicalBlock(scope: !558, file: !452, line: 28, column: 3)
!563 = !DILocation(line: 28, column: 11, scope: !562)
!564 = !DILocation(line: 28, column: 27, scope: !562)
!565 = !DILocation(line: 28, column: 13, scope: !562)
!566 = !DILocation(line: 28, column: 32, scope: !562)
!567 = !DILocation(line: 28, column: 7, scope: !562)
!568 = !DILocation(line: 28, column: 42, scope: !569)
!569 = !DILexicalBlockFile(scope: !570, file: !452, discriminator: 1)
!570 = distinct !DILexicalBlock(scope: !562, file: !452, line: 28, column: 3)
!571 = !DILocation(line: 28, column: 59, scope: !569)
!572 = !DILocation(line: 28, column: 45, scope: !569)
!573 = !DILocation(line: 28, column: 64, scope: !569)
!574 = !DILocation(line: 28, column: 92, scope: !569)
!575 = !DILocation(line: 28, column: 78, scope: !569)
!576 = !DILocation(line: 28, column: 97, scope: !569)
!577 = !DILocation(line: 28, column: 76, scope: !569)
!578 = !DILocation(line: 28, column: 43, scope: !569)
!579 = !DILocation(line: 28, column: 3, scope: !569)
!580 = !DILocalVariable(name: "id", scope: !581, file: !452, line: 30, type: !70)
!581 = distinct !DILexicalBlock(scope: !570, file: !452, line: 29, column: 4)
!582 = !DILocation(line: 30, column: 8, scope: !581)
!583 = !DILocation(line: 30, column: 27, scope: !581)
!584 = !DILocation(line: 30, column: 13, scope: !581)
!585 = !DILocation(line: 31, column: 24, scope: !586)
!586 = distinct !DILexicalBlock(scope: !581, file: !452, line: 31, column: 7)
!587 = !DILocation(line: 31, column: 8, scope: !586)
!588 = !DILocation(line: 31, column: 7, scope: !581)
!589 = !DILocation(line: 33, column: 23, scope: !590)
!590 = distinct !DILexicalBlock(scope: !586, file: !452, line: 32, column: 5)
!591 = !DILocation(line: 33, column: 16, scope: !590)
!592 = !DILocation(line: 33, column: 27, scope: !590)
!593 = !DILocation(line: 33, column: 12, scope: !590)
!594 = !DILocation(line: 33, column: 5, scope: !590)
!595 = !DILocation(line: 33, column: 15, scope: !590)
!596 = !DILocation(line: 34, column: 27, scope: !590)
!597 = !DILocation(line: 34, column: 5, scope: !590)
!598 = !DILocation(line: 34, column: 30, scope: !590)
!599 = !DILocation(line: 35, column: 5, scope: !590)
!600 = !DILocation(line: 36, column: 4, scope: !581)
!601 = !DILocation(line: 28, column: 109, scope: !602)
!602 = !DILexicalBlockFile(scope: !570, file: !452, discriminator: 2)
!603 = !DILocation(line: 28, column: 3, scope: !602)
!604 = distinct !{!604, !605}
!605 = !DILocation(line: 28, column: 3, scope: !558)
!606 = !DILocation(line: 37, column: 2, scope: !558)
!607 = !DILocation(line: 38, column: 1, scope: !451)
!608 = distinct !DISubprogram(name: "Kernel2", linkageName: "_Z7Kernel2PbS_S_S_i", scope: !609, file: !609, line: 22, type: !610, isLocal: false, isDefinition: true, scopeLine: 23, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!609 = !DIFile(filename: "./kernel2.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!610 = !DISubroutineType(types: !611)
!611 = !{null, !460, !460, !460, !460, !70}
!612 = !DILocalVariable(name: "g_graph_mask", arg: 1, scope: !608, file: !609, line: 22, type: !460)
!613 = !DILocation(line: 22, column: 16, scope: !608)
!614 = !DILocalVariable(name: "g_updating_graph_mask", arg: 2, scope: !608, file: !609, line: 22, type: !460)
!615 = !DILocation(line: 22, column: 36, scope: !608)
!616 = !DILocalVariable(name: "g_graph_visited", arg: 3, scope: !608, file: !609, line: 22, type: !460)
!617 = !DILocation(line: 22, column: 65, scope: !608)
!618 = !DILocalVariable(name: "g_over", arg: 4, scope: !608, file: !609, line: 22, type: !460)
!619 = !DILocation(line: 22, column: 88, scope: !608)
!620 = !DILocalVariable(name: "no_of_nodes", arg: 5, scope: !608, file: !609, line: 22, type: !70)
!621 = !DILocation(line: 22, column: 100, scope: !608)
!622 = !DILocalVariable(name: "tid", scope: !608, file: !609, line: 24, type: !70)
!623 = !DILocation(line: 24, column: 6, scope: !608)
!624 = !DILocation(line: 78, column: 3, scope: !479, inlinedAt: !625)
!625 = distinct !DILocation(line: 24, column: 12, scope: !608)
!626 = !DILocation(line: 24, column: 22, scope: !608)
!627 = !DILocation(line: 67, column: 3, scope: !518, inlinedAt: !628)
!628 = distinct !DILocation(line: 24, column: 47, scope: !629)
!629 = !DILexicalBlockFile(scope: !608, file: !609, discriminator: 1)
!630 = !DILocation(line: 24, column: 45, scope: !608)
!631 = !DILocation(line: 25, column: 6, scope: !632)
!632 = distinct !DILexicalBlock(scope: !608, file: !609, line: 25, column: 6)
!633 = !DILocation(line: 25, column: 10, scope: !632)
!634 = !DILocation(line: 25, column: 9, scope: !632)
!635 = !DILocation(line: 25, column: 22, scope: !632)
!636 = !DILocation(line: 25, column: 47, scope: !637)
!637 = !DILexicalBlockFile(scope: !632, file: !609, discriminator: 1)
!638 = !DILocation(line: 25, column: 25, scope: !637)
!639 = !DILocation(line: 25, column: 6, scope: !637)
!640 = !DILocation(line: 28, column: 16, scope: !641)
!641 = distinct !DILexicalBlock(scope: !632, file: !609, line: 26, column: 2)
!642 = !DILocation(line: 28, column: 3, scope: !641)
!643 = !DILocation(line: 28, column: 20, scope: !641)
!644 = !DILocation(line: 29, column: 19, scope: !641)
!645 = !DILocation(line: 29, column: 3, scope: !641)
!646 = !DILocation(line: 29, column: 23, scope: !641)
!647 = !DILocation(line: 30, column: 4, scope: !641)
!648 = !DILocation(line: 30, column: 10, scope: !641)
!649 = !DILocation(line: 31, column: 25, scope: !641)
!650 = !DILocation(line: 31, column: 3, scope: !641)
!651 = !DILocation(line: 31, column: 29, scope: !641)
!652 = !DILocation(line: 32, column: 2, scope: !641)
!653 = !DILocation(line: 33, column: 1, scope: !608)