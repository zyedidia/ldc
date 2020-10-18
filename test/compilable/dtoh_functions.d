/*
REQUIRED_ARGS: -HC -c -o-
PERMUTE_ARGS:
TEST_OUTPUT:
---
// Automatically generated by Digital Mars D Compiler

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

struct S;
struct S2;

extern "C" int32_t bar(int32_t x);

extern "C" int32_t bar2(int32_t x);

extern "C" int32_t bar4(int32_t x = 42);

extern int32_t baz(int32_t x);

extern int32_t baz2(int32_t x);

extern int32_t baz4(int32_t x = 42);

extern size_t baz5(size_t x = 42);

extern size_t& bazRef(size_t& x);

enum class E : int64_t
{
    m = 1LL,
};

extern void enums(uint64_t e = $?:32=1LLU|64=E::m$);

struct S
{
    int32_t i;
    int32_t get(int32_t , int32_t );
    static int32_t get();
    static const int32_t staticVar;
    S() :
        i()
    {
    }
};

extern S s;

extern void aggregates(int32_t a = s.i, int32_t b = s.get(1, 2), int32_t c = S::get(), int32_t d = S::staticVar);

struct S2
{
    S s;
    struct S3
    {
        static int32_t i;
        S3()
        {
        }
    };

    S2() :
        s()
    {
    }
};

extern S2 s2;

extern void chains(int32_t a = s2.s.i, int32_t b = S2::S3::i);

extern S* ptr;

extern int32_t(*f)(int32_t );

extern void special(int32_t a = ptr->i, int32_t b = ptr->get(1, 2), int32_t j = (*f)(1));

extern void strings(_d_dynamicArray< char > s = "\"Hello\\World!\"");

extern void variadic(int32_t _param_0, ...);
---
*/

int foo(int x)
{
    return x * 42;
}

extern (C) int fun();
extern (C++) int fun2();

extern (C) int bar(int x)
{
    return x * 42;
}

extern (C) static int bar2(int x)
{
    return x * 42;
}

extern (C) private int bar3(int x)
{
    return x * 42;
}

extern (C) int bar4(int x = 42)
{
    return x * 42;
}

extern (C++) int baz(int x)
{
    return x * 42;
}

extern (C++) static int baz2(int x)
{
    return x * 42;
}

extern (C++) private int baz3(int x)
{
    return x * 42;
}

extern (C++) int baz4(int x = 42)
{
    return x * 42;
}

extern (C++) size_t baz5(size_t x = 42)
{
    return x * 42;
}

extern (C++) ref size_t bazRef(return ref size_t x)
{
    return x;
}

extern (C++):

enum E : long
{
    m = 1
}

void enums(ulong e = E.m) {}

struct S
{
    int i;
    int get(int, int);
    static int get();
    static const int staticVar;
}

S s;

void aggregates(int a = s.i, int b = s.get(1, 2), int c = S.get(), int d = S.staticVar) {}

struct S2
{

    S s;
    static struct S3
    {
        static int i = 3;
    }
}

S2 s2;

void chains(int a = s2.s.i, int b = S2.S3.i) {}

S* ptr;
int function(int) f;

void special(int a = ptr.i, int b = ptr.get(1, 2), int j = f(1)) {}

void strings(string s = `"Hello\World!"`) {}

import core.stdc.stdarg;
void variadic(int, ...) {}
