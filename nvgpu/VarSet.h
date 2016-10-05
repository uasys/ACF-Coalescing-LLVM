#include "llvm/IR/Value.h"
#include <set>

using namespace llvm;

class VarSet {
  typedef std::set<Value *> set_t;
  public: // static methods
    static bool Eq( const VarSet& x, const VarSet& y );
    static VarSet Diff( const VarSet& x, const VarSet& y );
    static VarSet Union( const VarSet& x, const VarSet& y );
    static VarSet Intersect( const VarSet& x, const VarSet& y );
    static const VarSet& UniverseSet();
    static const VarSet& EmptySet();

  public:
    VarSet() {}
    VarSet( const VarSet& vs );
    VarSet( set_t, bool exclude ) : vars(vars), exclusionSet(exclude) {}

    VarSet& operator=( const VarSet& vs );
    std::ostream& print( std::ostream& ) const;
  private:
    bool exclusionSet;
    set_t vars;

    static VarSet* universe;
    static VarSet* empty;
};
