return {
    cmd = { 'ruff', 'server' },
    root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
    settings = {
        lazy = false,
    },
}
