# README

## Sources

```lang-none
css/
  banner.css [1]

ico/
  favicon.ico
images/
  ucsf-logo-banner.png [1]
  ucsf-wynton-logo.png
```

## How the UCSF Wynton logo was created

The logo was downloaded (on 2017-08-18) from the settings of Slack team [ucsf-wynton](https://ucsf-wynton.slack.com/messages).


## How the favicon was created

The favicon was created from the UCSF CBC logo using [ImageMagick](http://www.imagemagick.org/):
```sh
cd assets/
convert images/ucsf-wynton-logo.png -geometry 128x128 -define icon:auto-resize=64,48,32,16 favicon.ico ico/favicon.ico
```


## References

* [1] <https://github.com/ucsf-web-services/ucsf_identity_web_banner_templates>
