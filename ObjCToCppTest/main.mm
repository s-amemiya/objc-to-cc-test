
#include <vector>

using namespace std;

template <class T>
class ToCpp
{
public:
    typedef T ElementType;

    ToCpp(T* const t) : t_(t) {}
    T* get() const { return t_; }

private:
    T* t_;
};

@interface MyClass : NSObject
@end

@implementation MyClass
@end

typedef ToCpp<MyClass> RappedMyClass;

int main()
{
    RappedMyClass mc([[MyClass alloc] init]);

    vector<RappedMyClass> v;
    v.push_back(mc);

    return 0;
}
