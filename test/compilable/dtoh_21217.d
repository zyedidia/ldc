/*
REQUIRED_ARGS: -HC=verbose -c -o-
PERMUTE_ARGS:
TEST_OUTPUT:
---
// Automatically generated by Digital Mars D Compiler v$n$

#pragma once

#include <assert.h>
#include <stddef.h>
#include <stdint.h>

#ifdef CUSTOM_D_ARRAY_TYPE
#define _d_dynamicArray CUSTOM_D_ARRAY_TYPE
#else
/// Represents a D [] array
template<typename T>
struct _d_dynamicArray
{
    size_t length;
    T *ptr;

    _d_dynamicArray() : length(0), ptr(NULL) { }

    _d_dynamicArray(size_t length_in, T *ptr_in)
        : length(length_in), ptr(ptr_in) { }

    T& operator[](const size_t idx) {
        assert(idx < length);
        return ptr[idx];
    }

    const T& operator[](const size_t idx) const {
        assert(idx < length);
        return ptr[idx];
    }
};
#endif

struct Foo
{
    int32_t a;
    enum : int32_t { b = 2 };

    // Ignored enum `dtoh_21217.Foo.c` because it is `private`.
protected:
    enum : int32_t { d = 4 };

    enum : int32_t { e = 5 };

public:
    enum : int32_t { f = 6 };

    enum : int32_t { g = 7 };

private:
    enum class Bar
    {
        a = 1,
        b = 2,
    };

    // Ignored enum `dtoh_21217.Foo.h` because it is `private`.
public:
    Foo() :
        a(1)
    {
    }
};

---
*/


extern(C++) struct Foo {
  int a = 1;
  enum b = 2;
  private enum c = 3;
  protected enum d = 4;
  package enum e = 5;
  public enum f = 6;
  export enum g = 7;

  private enum Bar { a = 1, b = 2 }
  private enum h = Bar.a;
}
