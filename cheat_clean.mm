#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#include <mach-o/dyld.h>
#include <dlfcn.h>

// Hook через fishhook или через mach_override
// ...

__attribute__((constructor))
void init_cheat() {
    NSLog(@"[CHEAT] Loaded successfully");
}
