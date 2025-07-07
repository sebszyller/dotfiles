# Agent Guidelines for dotfiles

## Commands
- Formatting: `stylua --check .` or `stylua .` to format Lua files
- For fish scripts: `fish -n <file>` to check syntax
- Neovim: `:checkhealth` to verify plugins are working correctly

## Code Style
- **Lua**: Use spaces (not tabs), 4-space indentation
- **Variable naming**: snake_case for variables and functions
- **Imports**: Use `require()` for modules, organized by functionality
- **Globals**: Minimize global variables, use local when possible
- **Configuration**: Modular organization (see nvim/lua/config and nvim/lua/plugins)
- **Error handling**: Appropriate error messages and fallbacks
- **Comments**: Minimal, focused on "why" not "what"
- **Git commits**: Clear, concise, focused on single changes

## Conventions
- Fish functions: Place in `stow/.config/fish/functions/`
- Neovim plugins: Configure in separate files under `stow/.config/nvim/lua/plugins/`
- Use stow structure for proper symlink management

## AGENT Guidelines

- Use `AGENT:` or `AGENT-QUESTION:` (all-caps prefix) for comments aimed at AI and developers.
- Keep them concise (< 120 chars).
- **Update relevant anchors** when modifying associated code.
- **Do not remove `AGENT*` notes** without explicit human instruction.

Example:
# AGENT: perf-hot-path; avoid extra allocations (see ISSUE-1234)
