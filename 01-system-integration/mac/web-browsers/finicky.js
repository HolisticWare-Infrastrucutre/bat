// finicky.js
// Open social network links in Google Chrome
finicky.onUrl(function(url, opts) 
    {
        if 
            (
                url.match(/^https?:\/\/(youtube|facebook|twitter|linkedin)\.com/)
                ||
                url.match(/^https?:\/\/(www.)?vecernji\.hr/)
            ) 
        {
            return 
            {
                bundleIdentifier: "com.microsoft.Edge.Canary"
            };
        }
    }
);

// Open com.microsoft.Edge.Canary
finicky.onUrl
(
    function(url, opts) 
    {
        // https://devdiv.visualstudio.com/DevDiv
        if (url.match(/^https?:\/\/devdiv\.visualstudio\.com/)) 
        {
            return 
            {
            bundleIdentifier: "com.microsoft.Edge.Canary"
            };
        }
    }
);

// Open com.microsoft.Edge.Canary
finicky.onUrl
(
    function(url, opts) 
    {
        // https://devdiv.visualstudio.com/DevDiv
        if (url.match(/^https?:\/\/quora\.com/)) 
        {
            return 
            {
            bundleIdentifier: "com.microsoft.Edge.Canary"
            };
        }
    }
);

// Rewrite all Bing links to DuckDuckGo instead
finicky.onUrl(function(url, opts) 
{
    var url = url.replace(
      /^https?:\/\/www\.bing\.com\/search/,
      "https://duckduckgo.com"
    );
    return {
      url: url
    };
  });
  
// Always open links from Mail in Safari
finicky.onUrl
(
    function(url, opts) 
    {
        var sourceApplication = opts && opts.sourceBundleIdentifier;
        if 
        (
            //sourceApplication === "com.microsoft.Outlook"
            //sourceApplication === "com.apple.mail"
            sourceApplication === "org.mozilla.thunderbirdM"
        ) 
        {
            return 
            {
                bundleIdentifier: "com.apple.safari"
            };
        }
    }
);
  
// By supplying an array of bundle identifiers, finicky opens the url in the first one
// that's currently running. If none are running, the first app in the array is started.
finicky.onUrl
(
    function(url, opts) 
    {
        return 
        {
            bundleIdentifier: 
            [
                "org.mozilla.firefox",
                "com.apple.Safari",
                "com.google.Chrome"
            ]
        };
    }
);

