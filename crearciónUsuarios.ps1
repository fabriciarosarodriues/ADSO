
# Script: Crear usuarios y grupos en PowerShell

# Contraseña para todos los usuarios
$Password = ConvertTo-SecureString "M@ythe4th" -AsPlainText -Force

# Crear los grupos si no existen
if (-not (Get-LocalGroup -Name "profesores" -ErrorAction SilentlyContinue)) {
    New-LocalGroup -Name "profesores" -Description "Grupo de profesores"
}

if (-not (Get-LocalGroup -Name "alumnos" -ErrorAction SilentlyContinue)) {
    New-LocalGroup -Name "alumnos" -Description "Grupo de alumnos"
}

# Crear los usuarios profesor1 y profesor2
foreach ($user in @("profesor1", "profesor2")) {
    if (-not (Get-LocalUser -Name $user -ErrorAction SilentlyContinue)) {
        New-LocalUser -Name $user -Password $Password -FullName $user -Description "Usuario del grupo profesores"
        Add-LocalGroupMember -Group "profesores" -Member $user
    }
}

# Crear los usuarios alumno1 y alumno2
foreach ($user in @("alumno1", "alumno2")) {
    if (-not (Get-LocalUser -Name $user -ErrorAction SilentlyContinue)) {
        New-LocalUser -Name $user -Password $Password -FullName $user -Description "Usuario del grupo alumnos"
        Add-LocalGroupMember -Group "alumnos" -Member $user
    }
}

Write-Host "Usuarios y grupos creados correctamente."
