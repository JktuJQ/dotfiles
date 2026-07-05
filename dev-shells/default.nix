{
  nix = {
    path = ./nix;
    description = "Nix development with nil (LSP), nixfmt, nixpkgs-fmt, deadnix, statix; for writing Nix expressions and modules";
  };
  lua = {
    path = ./lua;
    description = "Lua 5.1–5.4 or LuaJIT with luarocks, busted, lua-language-server; customizable version";
  };
  python = {
    path = ./python;
    description = "Python 3.9–3.13 with venv, pip, pyright, black, mypy, pytest; customizable version";
  };
  c = {
    path = ./c;
    description = "C with gcc, gdb, make, cmake, valgrind; clangd and clang-format included";
  };
  cpp = {
    path = ./cpp;
    description = "C++ with gcc/clang, cmake, gdb, clang-tools (clangd/clang-format), cppcheck, conan, vcpkg, doxygen, gtest, lcov; customizable compiler";
  };
  rust = {
    path = ./rust;
    description = "Rust stable/beta/nightly with cargo, rust-analyzer, clippy, rustfmt; customizable channel via fenix";
  };
  haskell = {
    path = ./haskell;
    description = "Haskell with GHC (multiple versions), cabal, haskell-language-server, ghcid, hlint; customizable GHC version";
  };
  latex = {
    path = ./latex;
    description = "LaTeX with texlive-full, texlab, tectonic; full LaTeX document preparation";
  };
}
