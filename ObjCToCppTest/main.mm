#import <Foundation/Foundation.h>
#include <vector>

using namespace std;

template <class T>
class ToCpp
{
public:
    typedef T element_type;

    ToCpp(T* const t) : t_(t) {}
    T* get() const { return t_; }

private:
    T* t_;
};

@interface MyClass : NSObject
@end

@implementation MyClass
@end

typedef ToCpp<MyClass> WrappedMyClass;

int main()
{
    WrappedMyClass mc([[MyClass alloc] init]);

    vector<WrappedMyClass> v;
    v.push_back(mc);

    return 0;
}