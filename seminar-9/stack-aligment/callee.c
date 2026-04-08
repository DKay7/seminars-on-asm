#include <xmmintrin.h>

// Do not bother yourselves with the code below
// just believe that this functions really need the stack aligned
// it is crusial because of the spill that would definately happen while copying to y
__attribute__((noinline))
void i_need_stack_aligned(void) {
    __m128 x = _mm_set1_ps(1.0f);
    volatile __m128 y = x;
    (void)y;
}
