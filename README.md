# Player Value Manager

Manage and retrieve player values in FiveM with ease.

## Features

- Players can set their own values using the `/setvalue` command
- Players can retrieve their values using the `/getvalue` command

## Requirements

- FiveM server with ESX Legacy framework
- MySQL database

## Installation

1. Download the script files
2. Place them in your FiveM server's resources folder
3. Add `ensure player-value-manager` to your server.cfg

## Usage

### Commands

| Command | Description | Usage |
|---------|-------------|-------|
| /setvalue | Set your value | /setvalue <number> |
| /getvalue | Get your value | /getvalue |

## Configuration

The script can be configured in the `config.lua` file. You can set the default value and enable debug mode.

```lua
Config = {}

-- Database configuration
Config.Database = {
    TableName = 'fivemscript_data'
}

-- Script settings
Config.Settings = {
    EnableDebug = false,
    DefaultValue = 100
}
```

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=player-value-manager&utm_content=bottom) — describe it in one sentence and get the full source code.
