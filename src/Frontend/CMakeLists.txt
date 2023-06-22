list(APPEND Modules Controls Styles Js Backgrounds)

foreach (Module ${Modules})
    add_subdirectory(${Module})
endforeach (Module)

set(Modules ${Modules} PARENT_SCOPE)
