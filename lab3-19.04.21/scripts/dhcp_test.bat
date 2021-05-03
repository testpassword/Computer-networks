for /l %%i in (1, 1, 2) do (
    ipconfig /release
    ipconfig /renew
)