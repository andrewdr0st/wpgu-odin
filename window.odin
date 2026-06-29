package main

import "core:fmt"
import SDL "vendor:sdl3"

main :: proc() {
    if !SDL.Init({.VIDEO}) {
        fmt.panicf("SDL.Init error: ", SDL.GetError())
    }

    window := SDL.CreateWindow("z", 600, 600, {.RESIZABLE})
    if window == nil {
        return
    }

    running := true
    for running {
        e : SDL.Event
        for SDL.PollEvent(&e) {
            #partial switch (e.type) {
            case .QUIT:
                running = false
				break
            }
        }
    }

    SDL.DestroyWindow(window)
	SDL.Quit()
}