# oMLX

*   https://github.com/jundot/omlx

*   https://omlx.ai/

*   https://github.com/jundot/omlx

```shell
brew tap jundot/omlx https://github.com/jundot/omlx
brew install omlx
```


```shell
# Upgrade to the latest version
brew update && brew upgrade omlx
```


```shell
# Run as a background service (auto-restarts on crash)
brew services start omlx
```

```shell
# Run as a background service (auto-restarts on crash)
brew services stop omlx
```

brew services start omlx    # Start (auto-restarts on crash)
brew services stop omlx     # Stop
brew services restart omlx  # Restart
brew services info omlx     # Check status


```shell
# Optional: MCP (Model Context Protocol) support
/opt/homebrew/opt/omlx/libexec/bin/pip install mcp
```
