list(APPEND Modules Controls Styles Js Backgrounds Widgets Settings)

foreach (Module ${Modules})
    add_subdirectory(${Module})
endforeach (Module)

set(Modules ${Modules} PARENT_SCOPE)
