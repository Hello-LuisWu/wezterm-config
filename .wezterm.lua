local wezterm = require("wezterm")
local act = wezterm.action
local config = {
	set_environment_variables = {
		-- 设置 HTTP/HTTPS 代理
		-- HTTP_PROXY = "http://127.0.0.1:7890",
		-- HTTPS_PROXY = "http://127.0.0.1:7890",

		-- 可选：设置不经过代理的地址（如内网）
		--      NO_PROXY = "localhost,127.0.0.1,192.168.*",
	},

	default_workspace = "1:Home", -- 默认启动时进入开发工作区

	automatically_reload_config = true, -- 自动加载配置文件

	-- 字体设置
	font = wezterm.font("Iosevka Nerd Font"),
	font_size = 20.0,
	line_height = 1.2, -- 行高倍数

	-- 标签栏字体设置
	window_frame = {
		-- 标签栏中使用的字体。
		-- 默认使用 Roboto Bold 字体；该字体与 Wezterm 捆绑在一起。
		-- 无论选择哪种字体，都会将主字体设置附加到该字体上，以使用您可能在那里使用的任何备用字体。
		font = wezterm.font({ family = "Roboto", weight = "Bold" }),

		-- 标签栏中字体的大小。
		-- 在 Windows 上默认为 10.0，但在其他系统上默认为 12.0
		font_size = 18.0,

		-- 窗口处于焦点状态时，标签栏的整体背景颜色
		active_titlebar_bg = "#333333",

		-- 窗口未处于焦点状态时，标签栏的整体背景颜色
		inactive_titlebar_bg = "#333333",
	},

	color_scheme = "Gruvbox Dark (Gogh)",
	--[[ colors = {
        -- 16 到 255 的调色板索引颜色
        -- 可以自定义索引颜色，例如索引 136 设置为橙色
        indexed = {
            [136] = "#af8700", -- 索引 136 的颜色
            [16] = "#cb4b16",  -- 扩展橙色
            [17] = "#d33682",  -- 扩展品红色
        },

        -- 默认前景色（文本颜色）
        foreground = '#c0c4c3',

        -- 默认背景色
        background = '#15231b',

        -- 光标颜色
        cursor_bg = '#00ffff',     -- 光标背景色
        cursor_fg = '#1e1e1e',     -- 光标前景色
        cursor_border = '#c0c0c0', -- 光标边框颜色

        -- 选中文本的颜色
        selection_fg = '#1e1e1e', -- 选中文本的前景色
        selection_bg = '#c0c0c0', -- 选中文本的背景色

        -- 滚动条颜色
        scrollbar_thumb = '#ffffff', -- 滚动条滑块颜色

        -- 分割线颜色
        split = '#444444', -- 窗口分割线的颜色

        -- 终端标准 16 色的前 8 种（ANSI 颜色）
        ansi = {
            "#073642", -- 黑色（ANSI 0）
            "#dc322f", -- 红色（ANSI 1）
            "#859900", -- 绿色（ANSI 2）
            "#b58900", -- 黄色（ANSI 3）
            "#268bd2", -- 蓝色（ANSI 4）
            "#d33682", -- 品红色（ANSI 5）
            "#2aa198", -- 青色（ANSI 6）
            "#eee8d5", -- 白色（ANSI 7）
        },

        -- 终端标准 16 色的后 8 种（高亮/明亮颜色）
        brights = {
            "#002b36", -- 亮黑色（ANSI 8，通常用于终端默认背景）
            "#cb4b16", -- 亮红色（ANSI 9）
            "#586e75", -- 亮绿色（ANSI 10）
            "#657b83", -- 亮黄色（ANSI 11）
            "#839496", -- 亮蓝色（ANSI 12）
            "#6c71c4", -- 亮品红色（ANSI 13）
            "#93a1a1", -- 亮青色（ANSI 14）
            "#fdf6e3", -- 亮白色（ANSI 15）
        },

        -- 标签栏颜色配置
        tab_bar = {
            -- 标签栏背景色
            background = '#222222',

            -- 活动标签的颜色
            active_tab = {
                bg_color = '#333222', -- 活动标签的背景色
                fg_color = '#ffffff', -- 活动标签的前景色
            },

            -- 非活动标签的颜色
            inactive_tab = {
                bg_color = '#222111', -- 非活动标签的背景色
                fg_color = '#c0c0c0', -- 非活动标签的前景色
            },

            -- 新标签按钮的颜色
            new_tab = {
                bg_color = '#333333', -- 新标签按钮的背景色
                fg_color = '#c0c0c0', -- 新标签按钮的前景色
            },

            -- 非活动标签边缘/分隔线的颜色
            inactive_tab_edge = '#575757',
        },

        -- 自 20220319-142410-0fcdea07 版本起
        -- 当输入法（IME）、死键或 Leader 键正在处理输入时，
        -- 将光标颜色更改为该颜色，以提供视觉提示
        compose_cursor = 'orange', -- 输入法状态下的光标颜色

        -- 复制模式和快速选择模式的颜色
        -- 自 20220807-113146-c2fee766 版本起可用
        -- 在复制模式下，活动文本的颜色为：
        -- 1. 如果使用鼠标选择了额外文本，则使用 copy_mode_active_highlight_* 颜色
        -- 2. 否则使用 selection_* 颜色
        copy_mode_active_highlight_bg = { Color = '#000000' },   -- 复制模式活动高亮背景色
        copy_mode_active_highlight_fg = { AnsiColor = 'Black' }, -- 复制模式活动高亮前景色（使用 ANSI 颜色名称）

        -- 非活动高亮颜色
        copy_mode_inactive_highlight_bg = { Color = '#52ad70' },   -- 复制模式非活动高亮背景色
        copy_mode_inactive_highlight_fg = { AnsiColor = 'White' }, -- 复制模式非活动高亮前景色（使用 ANSI 颜色名称）

        -- 快速选择模式的颜色
        quick_select_label_bg = { Color = 'peru' },     -- 快速选择标签的背景色
        quick_select_label_fg = { Color = '#ffffff' },  -- 快速选择标签的前景色
        quick_select_match_bg = { AnsiColor = 'Navy' }, -- 快速选择匹配项的背景色（使用 ANSI 颜色名称）
        quick_select_match_fg = { Color = '#ffffff' },  -- 快速选择匹配项的前景色
    }, ]]
	-- color_rules = {
	--     {
	--         intensity = "Bold",
	--         italic = true,
	--         fg = "#dc322f", -- 红色
	--         regex = "\\b(ERROR|FATAL)\\b",
	--     },
	-- },

	-- Tab 设置
	show_tab_index_in_tab_bar = true, -- 是否显示bab 编号
	enable_tab_bar = true, -- 启用标签栏
	hide_tab_bar_if_only_one_tab = false, -- 单个标签时隐藏标签栏
	use_fancy_tab_bar = true, -- 标签页样式
	tab_bar_at_bottom = false, -- tab位置
	tab_max_width = 16, -- tab 最大宽度（字符宽度）

	-- 设置非活动窗格的视觉效果
	inactive_pane_hsb = {
		saturation = 0.9, -- 饱和度（0.0-1.0）
		brightness = 0.8, -- 亮度（0.0-1.0）
	},

	-- default_prog = {
	--     'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe',
	--     '-NoExit', -- 保持窗口打开
	--     '-Command', 'echo "Hello, 吴先生!"', -- 启动时执行的命令
	-- },

	-- default_prog = { '/bin/zsh' },
	-- launch_menu = {
	--     { label = "Bash", args = { '/bin/bash' } },
	--     { label = "bash", args = { '/bin/bash' } },
	-- },

	-- 显示滚动条
	enable_scroll_bar = true,
	window_decorations = "TITLE | RESIZE", -- 窗口样式："NONE"|"TITLE"|"RESIZE"
	text_background_opacity = 1,
	window_background_opacity = 0.8,
	macos_window_background_blur = 77, -- 针对 macos 的背景模糊
	window_padding = {
		left = 8,
		right = 8,
		top = 8,
		bottom = 8,
	},
	window_background_image = "C:\\Users\\m\\bg\\q.jpg",
	window_background_image_hsb = {
		brightness = 0.1, -- 降低图片亮度
		hue = 1.0, -- 色相
		saturation = 0.3, -- 饱和度
	},

	-- 'AlwaysPrompt'：总是弹出确认对话框。
	-- 'NeverPrompt'：从不弹出确认对话框，直接关闭窗口。
	-- 'SmartPrompt'：智能判断是否需要弹出确认对话框（例如，当有多个标签页或运行中的进程时会提示）。
	-- 关闭窗口时总是弹出确认对话框
	window_close_confirmation = "NeverPrompt",

	-- 光标样式 SteadyBlock BlinkingBlock SteadyUnderline BlinkingUnderline SteadyBar BlinkingBar
	default_cursor_style = "SteadyBlock",

	--     background = {
	--         {
	--             source = {
	--                 Color = "#301934", -- dark purple
	--             },
	--             width = "100%",
	--             height = "100%",
	--             opacity = 0.85,
	--         },
	--     },

	-- 设置初始窗口大小
	initial_rows = 50, -- 初始高度为 50 行
	initial_cols = 100, -- 初始宽度为 100 列

	-- ... 你原有的其他配置保持不变 ...

	-- ... 保持其他原有配置不变 ...
}

-- 定义工作区
wezterm.on("update-right-status", function(window, pane)
	local workspace = window:active_workspace()
	window:set_right_status(wezterm.format({
		{ Text = "Workspace: " .. workspace },
	}))
end)

-- onfig.leader = { key = 'Space', mods = 'CTRL|SHIFT' }
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- 切换工作区
	{ key = "1", mods = "LEADER", action = act.SwitchToWorkspace({ name = "1:Home" }) },
	{ key = "2", mods = "LEADER", action = act.SwitchToWorkspace({ name = "2:test" }) },
	{ key = "3", mods = "LEADER", action = act.SwitchToWorkspace({ name = "3:ops" }) },
	{ key = "4", mods = "LEADER", action = act.SwitchToWorkspace({ name = "4:dev" }) },

	-- 创建工作区
	{ key = "n", mods = "LEADER|SHIFT", action = act.SwitchToWorkspace }, -- 创建并切换到新工作区
	{
		key = "l",
		mods = "LEADER",
		action = act.ShowLauncherArgs({ flags = "WORKSPACES" }), -- 显示工作区列表
	},
	-- 重命名当前工作区
	{
		key = "R",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PromptInputLine({
			description = "Enter new workspace name",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:perform_action(wezterm.action.ActivateWorkspace({ name = line }), pane)
				end
			end),
		}),
	},

	-- 复制模式（类似 tmux 的快捷键）
	{ key = "i", mods = "LEADER", action = act.ActivateCopyMode }, -- 进入复制模式
	{ key = "y", mods = "LEADER", action = act.CopyTo("ClipboardAndPrimarySelection") }, -- 复制选中内容到剪贴板

	-- 字体大小调整
	{ key = "+", mods = "CTRL", action = act.IncreaseFontSize }, -- 增大字体
	{ key = "-", mods = "CTRL", action = act.DecreaseFontSize }, -- 减小字体
	{ key = "0", mods = "CTRL", action = act.ResetFontSize }, -- 重置字体大小

	-- 调整窗格大小
	{ key = "LeftArrow", mods = "SHIFT|CTRL", action = act.AdjustPaneSize({ "Left", 5 }) }, -- 向左调整窗格大小
	{ key = "DownArrow", mods = "SHIFT|CTRL", action = act.AdjustPaneSize({ "Down", 5 }) }, -- 向下调整窗格大小
	{ key = "UpArrow", mods = "SHIFT|CTRL", action = act.AdjustPaneSize({ "Up", 5 }) }, -- 向上调整窗格大小
	{ key = "RightArrow", mods = "SHIFT|CTRL", action = act.AdjustPaneSize({ "Right", 5 }) }, -- 向右调整窗格大小

	-- 调整窗口焦点
	{ key = "LeftArrow", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "CTRL", action = act.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
	{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) }, -- 垂直分割窗格
	{ key = "\\", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) }, -- 水平分割窗格
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState }, -- 最大化/恢复当前窗格
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = false }) }, -- 关闭当前窗格

	{ key = "q", mods = "LEADER", action = act.QuitApplication }, -- 退出 wezterm
	{ key = "h", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "v", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "q", mods = "CTRL", action = act.CloseCurrentPane({ confirm = false }) },

	-- 窗口操作
	{ key = "Enter", mods = "ALT", action = act.ToggleFullScreen }, -- 切换全屏
	{ key = "f", mods = "LEADER", action = act.Search({ CaseInSensitiveString = "" }) }, -- 打开搜索框
	{ key = "r", mods = "LEADER", action = act.ReloadConfiguration }, -- 重新加载配置文件

	{ key = "v", mods = "LEADER", action = act.PasteFrom("Clipboard") }, -- 粘贴剪贴板内容
	{ key = "s", mods = "LEADER", action = act.ShowLauncher }, -- 显示启动器（标签页和窗格导航）

	-- 标签页操作
	{ key = "t", mods = "CTRL | SHIFT", action = act.SpawnTab("CurrentPaneDomain") }, -- 新建标签页
	{ key = "c", mods = "LEADER", action = act.CloseCurrentTab({ confirm = true }) }, -- 关闭当前标签页
	{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) }, -- 切换到下一个标签页
	{ key = "Tab", mods = "CTRL | SHIFT", action = act.ActivateTabRelative(-1) }, -- 切换到上一个标签页
	--  { key = '1', mods = 'LEADER', action = act.ActivateTab(0) },  -- 切换到第 1 个标签页
	--  { key = '2', mods = 'LEADER', action = act.ActivateTab(1) },  -- 切换到第 2 个标签页
	--  { key = '3', mods = 'LEADER', action = act.ActivateTab(2) },  -- 切换到第 3 个标签页

	-- CTRL + SHIFT + 1 创建新Tab - WSL
	-- {
	--     key = '!',
	--     mods = 'CTRL|SHIFT',
	--     action = act.SpawnCommandInNewTab {
	--         domain = 'DefaultDomain',
	--         args = { 'wsl', '-d', 'Ubuntu-20.04' },
	--     }
	-- },
	-- {
	--     key = '@',
	--     mods = 'CTRL|SHIFT',
	--     action = act.SpawnCommandInNewTab {
	--         args = { 'cmd' },
	--     }
	-- },
	-- {
	--     key = '#',
	--     mods = 'CTRL|SHIFT',
	--     action = act.SpawnCommandInNewTab {
	--         domain = 'DefaultDomain',
	--         args = { 'pwsh' },
	--     }
	-- }
}

-- for i = 1, 8 do
--     -- CTRL + number to activate that tab
--     table.insert(config.keys, {
--         key = tostring(i),
--         mods = 'CTRL',
--         action = act.ActivateTab(i - 1),
--     })
-- end

-- -------------------- 鼠标绑定 --------------------
-- config.mouse_bindings = {
--     -- copy the selection
--     {
--         event = { Up = { streak = 1, button = 'Left' } },
--         mods = 'NONE',
--         action = act.CompleteSelection 'ClipboardAndPrimarySelection',
--     },

--     -- Open HyperLink
--     {
--         event = { Up = { streak = 1, button = 'Left' } },
--         mods = 'CTRL',
--         action = act.OpenLinkAtMouseCursor,
--     },
-- }
return config
