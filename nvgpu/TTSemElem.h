#include "wali/SemElem.hpp"
#include "VarSet.h"

using namespace wali;

class ThreadDependent : public SemElem {
    public:
      ThreadDependent() : dependent(b) {}
      virtual ~ThreadDependent() {}
      sem_elem_t one() const { return new ThreadDependent(true); }
      sem_elem_t zero() const { return new ThreadDependent(false); }
      sem_elem_t extend(SemElem * rhs) {
        ThreadDependent *td = static_cast<ThreadDependent*>(rhs);
        return new ThreadDependent(dependent && td->dependent);
      }
      sem_elem_t combine(SemElem * rhs) {
        ThreadDependent *td = static_cast<ThreadDependent*>(rhs);
        return new ThreadDependent(dependent || td->dependent);
      }
      bool equal(SemElem *rhs) const {
        ThreadDependent *td = static_cast<ThreadDependent*>(rhs);
        return td->dependent == dependent;
      }
      ostream& print(ostream& o) const {
          return (dependent) ? o << "Propagate" : o << "Constant";
      }
}
