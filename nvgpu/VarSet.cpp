#include "VarSet.h"

#include <iostream>
#include <algorithm>

std::ostream& operator<<( std::ostream& o , const VarSet& vs )
{
    vs.print(o);
    return o;
}

bool VarSet::Eq( const VarSet& x, const VarSet& y ) {
  if(x.exclusionSet != y.exclusionSet)
    return false;
  return x.vars == y.vars;
}

VarSet VarSet::Diff( const VarSet& x, const VarSet& y )
{
  set_t out;
  if(!x.exclusionSet && !y.exclusionSet) {
    std::set_difference(x.vars.begin(), x.vars.end(), y.vars.begin(), y.vars.end(),
                        std::inserter(out, out.begin()));
    return *(new VarSet( out, false ));

  } else if(!x.exclusionSet && y.exclusionSet) {
    std::set_union(x.vars.begin(), x.vars.end(), y.vars.begin(), y.vars.end(),
                        std::inserter(out, out.begin()));
    return *(new VarSet( out, true ));

  } else if(x.exclusionSet && !y.exclusionSet) {
    std::set_union(x.vars.begin(), x.vars.end(), y.vars.begin(), y.vars.end(),
                   std::inserter(out, out.begin()));
    return *(new VarSet( out, false ));

  } else if(x.exclusionSet && y.exclusionSet) {
    std::set_difference(y.vars.begin(), y.vars.end(), x.vars.begin(), x.vars.end(),
                        std::inserter(out, out.begin()));
    return *(new VarSet( out, false ));
  }
  // Should never reach here
  return x;
}

VarSet VarSet::Union( const VarSet& x, const VarSet& y )
{
  set_t out;

  if(!x.exclusionSet && !y.exclusionSet) {
    std::set_union(x.vars.begin(), x.vars.end(), y.vars.begin(), y.vars.end(),
                   std::inserter(out, out.begin()));
    return *(new VarSet ( out, false ));

  } else if(!x.exclusionSet && y.exclusionSet) {
    std::set_difference(y.vars.begin(), y.vars.end(), x.vars.begin(), x.vars.end(),
                        std::inserter(out, out.begin()));
    return *(new VarSet ( out, true ));

  } else if(x.exclusionSet && !y.exclusionSet) {
    std::set_difference(x.vars.begin(), x.vars.end(), y.vars.begin(), y.vars.end(),
                        std::inserter(out, out.begin()));
    return *(new VarSet( out, true ));

  } else if(x.exclusionSet && y.exclusionSet) {
    std::set_intersection(y.vars.begin(), y.vars.end(), x.vars.begin(), x.vars.end(),
                          std::inserter(out, out.begin()));
    return *(new VarSet ( out, true ));
  }
  // Should never reach here
  return x;
}

VarSet VarSet::Intersect( const VarSet& x, const VarSet& y )
{
  set_t out;

  if(!x.exclusionSet && !y.exclusionSet) {
    std::set_intersection(x.vars.begin(), x.vars.end(), y.vars.begin(), y.vars.end(),
                          std::inserter(out, out.begin()));
    return *(new VarSet ( out, false ));

  } else if(!x.exclusionSet && y.exclusionSet) {
    std::set_difference(x.vars.begin(), x.vars.end(), y.vars.begin(), y.vars.end(),
                        std::inserter(out, out.begin()));
    return *(new VarSet ( out, false ));

  } else if(x.exclusionSet && !y.exclusionSet) {
    std::set_difference(y.vars.begin(), y.vars.end(), x.vars.begin(), x.vars.end(),
                        std::inserter(out, out.begin()));
    return *(new VarSet( out, false ));

  } else if(x.exclusionSet && y.exclusionSet) {
    std::set_union(x.vars.begin(), x.vars.end(), y.vars.begin(), y.vars.end(),
                   std::inserter(out, out.begin()));
    return *(new VarSet ( out, true ));
  }
  // Should never reach here
  return x;
}

const VarSet& VarSet::UniverseSet() {
  if(universe == nullptr) {
    set_t empty;
    universe = new VarSet( empty, true );
  }
  return *universe;
}

const VarSet& VarSet::EmptySet() {
  if(universe == nullptr) {
    set_t eset;
    empty = new VarSet( eset, false );
  }
  return *universe;
}

VarSet& VarSet::operator=( const VarSet& vs )
{
  vars = vs.vars;
  exclusionSet = vs.exclusionSet;
  return *this;
}

std::ostream& VarSet::print( std::ostream& o ) const {
  o << (exclusionSet ? "NOT<" : "<");
  for(auto i=vars.begin(),e=vars.end(); i!=e; ++i)
    o << *i;
  return o << ">";
}
