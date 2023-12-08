config.load_autoconfig(False)

c.spellcheck.languages = ["en-US"]

c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}&kae=d&k1=-1&kp=-1&kl=wt-wt",
    "ddgl": "https://lite.duckduckgo.com/lite/?q={}",
    "mg": "https://metager.org/meta/meta.ger3?eingabe={}",
    "qw": "https://www.qwant.com/?q={}&t=web",
    "sp": "https://www.startpage.com/sp/search?query={}",
    "ss": "https://sepiasearch.org/search?search={}"
}

# Look and feel
try:
    import catppuccin

    catppuccin.setup(c, "mocha", True)

except ModuleNotFoundError:
    ...

c.changelog_after_upgrade = "patch"

c.fonts.default_size = "14pt"
c.fonts.default_family = "Ubuntu Nerd Font"

c.colors.webpage.darkmode.enabled = False

if not c.colors.webpage.darkmode.enabled:
    c.colors.webpage.bg = "white"

c.tabs.title.format = "{audio} {index}° {current_title}"

c.completion.open_categories = ["searchengines",
                                "quickmarks",
                                "bookmarks",
                                "history",
                                "filesystem"]

c.content.headers.user_agent = ("Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
"AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36")

# External commands
c.editor.command = ["gvim", "-f", "{file}", "-c", "normal {line}G{column0}l"]

# Privacy
c.content.webgl = False
c.content.autoplay = False
c.auto_save.session = False
c.content.private_browsing = True
c.content.headers.do_not_track = False

# Bindings for normal mode
config.unbind('d', mode='normal')

config.bind("<Ctrl+Shift+m>", "bookmark-del")

config.unbind('Sb', mode='normal')
config.bind('<Ctrl+Shift+b>', 'bookmark-list --jump')

config.bind("^", "move-to-start-of-line")

if c.zoom.default == "100%":
    config.bind("0", "zoom -q")

else:
    config.bind("0", "zoom -q 100")

config.bind(",ce", "config-edit")

config.bind(",cs", "config-source")

config.bind(",p", "spawn --detach mpv --player-operation-mode=pseudo-gui {url}")

config.bind("<Ctrl+l>", "clear-messages")

# Per-site configurations
with config.pattern("https://*.fandom.com/wiki/*") as p:
    p.content.javascript.enabled = False

config.set("content.images", True, "devtools://*")
config.set("content.images", True, "chrome-devtools://*")

config.set("content.cookies.accept", "all", "devtools://*")
config.set("content.cookies.accept", "all", "chrome-devtools://*")

config.set("content.javascript.enabled", True, "qute://*/*")
config.set("content.javascript.enabled", True, "devtools://*")
config.set("content.javascript.enabled", True, "chrome://*/*")
config.set("content.javascript.enabled", True, "chrome-devtools://*")
