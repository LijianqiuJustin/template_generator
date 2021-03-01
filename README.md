# TemplateGenerator

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'template_generator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install template_generator

## Usage

Generate cms layout files:
    `
    $ rails generate template_generator:cms_layout
    `
    files will be created:
      `create  app/views/layouts/admin.html.haml`
      `create  app/views/layouts/_head.html.haml`
      `create  app/views/application/_toast.html.haml`
      `create  app/views/application/_admin_header.html.haml`
      `create  app/views/application/_admin_footer.html.haml`
      `create  app/views/application/_sidenav_admin.html.haml`
Generate Stylesheets Preset files:
    `
    $ rails generate preset_generator:stylesheets
    `
    files will be created:
      create  app/assets/stylesheets/_settings.scss
      `create  app/assets/stylesheets/components/footer.sass`
      `create  app/assets/stylesheets/components/form.sass`
      `create  app/assets/stylesheets/components/header.sass`
      `create  app/assets/stylesheets/components/sidenav.sass`
      `create  app/assets/stylesheets/components/table.sass`
      `create  app/assets/stylesheets/core/_core.sass`
      `create  app/assets/stylesheets/core/mixins/_all.sass`
      `create  app/assets/stylesheets/core/mixins/_animation.sass`
      `create  app/assets/stylesheets/core/mixins/_buttons.sass`
      `create  app/assets/stylesheets/core/mixins/_components.sass`
      `create  app/assets/stylesheets/core/mixins/_customize.sass`
      `create  app/assets/stylesheets/core/mixins/_type.sass`
      `create  app/assets/stylesheets/foundation.sass`
      `create  app/assets/stylesheets/global-style.sass`
      `create  app/assets/stylesheets/layouts/rails-template.sass`
      `create  app/assets/stylesheets/preset/colors.scss`
      `create  app/assets/stylesheets/preset/fonts.sass`
      `create  app/javascript/packs/style.sass`
      `append  app/javascript/packs/application.js`
      `insert  app/javascript/packs/application.js`
      `insert  package.json`
      `gsub  config/webpacker.yml`
      `gsub  config/webpacker.yml`

Run `yarn install` to install `foundation`, `jquery`, and `motion-ui` 

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
