#Requires AutoHotkey v2.0

scrollCooldown := false

ScrollDesktop(direction) {
    global scrollCooldown  ; necessário para acessar a variável global

    if scrollCooldown
        return
    scrollCooldown := true

    if (direction = "left") {
        SendEvent("^#{Left}")
    } else if (direction = "right") {
        SendEvent("^#{Right}")
    }

    Sleep(100)  ; tempo para garantir que o Windows processe o atalho
    SetTimer () => scrollCooldown := false, -200  ; debounce de 200ms
}

#WheelUp::ScrollDesktop("left")
#WheelDown::ScrollDesktop("right")