# build.ps1 — PowerShell script to clean, configure, and build ARM project

# Stop on any error
 
 $ErrorActionPreference = "Stop"

# Remove old build folder
Write-Host "Cleaning previous build..."
if (Test-Path -Path "./build") {
    Remove-Item -Recurse -Force "./build"
}

# Run CMake configuration
Write-Host "Running CMake..."
cmake -G "Unix Makefiles" -B build -S . -DCMAKE_TOOLCHAIN_FILE="build-system/cmake/arm-gcc-toolchain.cmake"

# Change to build directory temporarily
Push-Location "./build"

# Build using make
Write-Host "Building project..."
make

# Return to original directory
Pop-Location

# Done
Write-Host "Build complete!"
