
(use-package elfeed
    :ensure t
    :config
    (evil-leader/set-key
      "ee" 'elfeed
      "eu" 'elfeed-update)
    (evil-set-initial-state 'elfeed-search-mode 'emacs)
    (evil-set-initial-state 'elfeed-show-mode 'emacs)
    (setf url-queue-timeout 30)
    (setq-default elfeed-search-filter "@1-week-ago +unread ")
    (define-key elfeed-search-mode-map "v" #'set-mark-command)
    (define-key elfeed-search-mode-map "j" #'next-line)
    (define-key elfeed-search-mode-map "k" #'previous-line)
    (define-key elfeed-search-mode-map "h" #'backward-char)
    (define-key elfeed-search-mode-map "l" #'forward-char)
    (define-key elfeed-show-mode-map "k" #'scroll-down-line)
    (define-key elfeed-show-mode-map "j" #'scroll-up-line)
    (setq elfeed-feeds
(quote
    ("http://endlessparentheses.com/atom.xml"
 "http://www.economist.com/sections/science-technology/rss.xml"
 "http://survivejs.com/atom.xml"
 "http://blog.aaronbieber.com/feed.xml"
 "http://feeds.feedburner.com/SanityInc"
 "http://planet.emacsen.org/atom.xml"
 "http://pragmaticemacs.com/feed/"
 "http://sachachua.com/blog/feed"
 "http://feeds.feedburner.com/paul-irish"
 "https://scotch.io/feed"
 "http://feeds.feedburner.com/AlexSexton"
 "https://www.smashingmagazine.com/feed/"
 "http://feeds.feedburner.com/SixRevisions"
 "https://davidwalsh.name/feed/atom"
 "http://speckyboy.com/feed/"
 "http://www.onextrapixel.com/feed/"
 "http://webresourcesdepot.com/feed/"
 "http://www.phpied.com/feed/"
 "http://dailyjs.com/rss/"
 "http://www.unixmen.com/feed/"
 "http://www.cyberciti.biz/feed/"
 "http://feeds.feedburner.com/codinghorror/"
 "http://feeds.feedburner.com/arkency.xml"
 "http://blog.andrewray.me/rss/"
 "http://www.justinweiss.com/atom.xml"
 "http://devblog.avdi.org/feed/"
 "http://osxdaily.com/category/tips-tricks/feed/"
 "http://feeds.feedburner.com/theiphoneblog"
 "http://www.macstories.net/feed/"
 "http://9to5mac.com/feed/"
 "http://rss.macworld.com/macworld/feeds/main"
 "http://www.cnblogs.com/renly/rss"
 "http://feeds.feedburner.com/ruanyifeng"
 "http://wangbixi.com/feed/"
 "http://mindhacks.cn/feed/"
 "http://blog.zhaojie.me/rss"
 "http://feed.williamlong.info/"
 "http://feeds.feedburner.com/playpc"
 "http://songshuhui.net/feed"
 "http://sspai.com/feed"
 "http://feeds.geekpark.net/"
 "http://feed.iplaysoft.com/"
 "http://www.ifanr.com/feed"
 "http://www.waerfa.com/feed"
 "http://lucumr.pocoo.org/feed.atom"
 "http://blog.evernote.com/feed/"
 "http://blog.atom.io/feed.xml"
 "http://feeds.feedburner.com/ScottHanselman"
 "http://feeds2.feedburner.com/Command-line-fu"
 "http://htedsv.logdown.com/posts.rss"
 "http://www.tennfy.com/feed"
 "http://maybeiwill.me/feed/"
 "http://hansay.com/atom.xml"
 "http://blog.csdn.net/liuyukuan/rss/list"
 "http://feeds.feedburner.com/zenhabits"
 "http://feeds.gawker.com/lifehacker/vip"))
	  )
    )
