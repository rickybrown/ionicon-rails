# ionicon-rails

ionicon-rails provides the
[ionicons](http://ionicons.com/) web fonts and
stylesheets as a Rails engine for use outside of the ionic framework & with the asset pipeline.

## Installation

Add this to your Gemfile:

```ruby
gem "ionicon-rails"
```

and run `bundle install`.

## Usage

In your `application.css`, include the css file:

```css
/*
 *= require ionicons
 */
```
Then restart your webserver if it was previously running.

### Sass Support

If you prefer [SCSS](http://sass-lang.com/documentation/file.SASS_REFERENCE.html), add this to your
`application.css.scss` file:

```scss
@import "ionicons";
```

If you use the
[Sass indented syntax](http://sass-lang.com/docs/yardoc/file.INDENTED_SYNTAX.html),
add this to your `application.css.sass` file:

```sass
@import ionicons
```

### Helpers

There are also some helpers (`ion` and `fa_stacked_icon`) that make your
views _icontastic!_

```ruby
ion "social-github"
# => <i class="fa fa-social-github"></i>

ion "social-github", text: "Take a photo"
# => <i class="fa fa-social-github"></i> Take a photo

ion "social-github", text: "Get started", right: true
# => Get started <i class="fa fa-social-github"></i>
```

## Misc

### Rails engines

When building a Rails engine that includes ionicon-rails as a dependency,
be sure to `require "ionicon-rails"` somewhere during the intialization of
your engine. Otherwise, Rails will not automatically pick up the load path of
the ionicon-rails assets and helpers

### Deploying to sub-folders

It is sometimes the case that deploying a Rails application to a production
environment requires the application to be hosted at a sub-folder on the server.
This may be the case, for example, if Apache HTTPD or Nginx is being used as a
front-end proxy server, with Rails handling only requests that come in to a sub-folder
such as `http://example.com/myrailsapp`. In this case, the
FontAwesome gem (and other asset-serving engines) needs to know the sub-folder,
otherwise you can experience a problem roughly described as ["my app works
fine in development, but fails when I deploy
it"](https://github.com/bokmann/ionicon-rails/issues/74).

To fix this, set the *relative URL root* for the application. In the
environment file for the deployed version of the app, for example
`config/environments/production.rb`,
set the config option `action_controller.relative_url_root`:

    MyApp::Application.configure do
      ...

      # set the relative root, because we're deploying to /myrailsapp
      config.action_controller.relative_url_root  = "/myrailsapp"

      ...
    end

The default value of this variable is taken from `ENV['RAILS_RELATIVE_URL_ROOT']`,
so configuring the environment to define `RAILS_RELATIVE_URL_ROOT` is an alternative strategy.

### Rails 3.2

**Note:** In Rails 3.2, make sure ionicon-rails is outside the bundler asset group
so that these helpers are automatically loaded in production environments.
