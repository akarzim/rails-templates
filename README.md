# rails-templates
My own DRY Rails templates

## Requirements
### Git version control system
Git version control system is used and each sub-template performs a separate commit after run.
Please visit the [Git official website](http://git-scm.com/) to download and install it.

### Ruby/Git gem
The [Ruby/Git](https://rubygems.org/gems/git) gem is a library for using Git in Ruby. We use it to add author credits in the footer.

#### Installation
You can install Ruby/Git like this:

```shell
$ gem install git
```

### Optional requirements
#### Git-Flow
Your new Rails app can be configured to use the Git-Flow branching model based on [Vincent Driessen's work](http://nvie.com/posts/a-successful-git-branching-model/). You may want to have a look at this [cheetsheet](https://danielkummer.github.io/git-flow-cheatsheet/) to understand and visualize how it works.

##### Installation
Please visit the official wiki page to proceed to [Installation](https://github.com/nvie/gitflow/wiki/Installation).

## Templates

The main template is named `base.rb` and applies sub-templates in this order :

1. environment
2. template-engine
3. test-framework
4. assets
5. layout
6. locale
7. dry
8. root

### Base
Your new Rails app will be versioned with Git and each one of the following sub-template will perform a separate commit. Optionally, you can opt in to use the Git Flow branching model.

### Environment
Here we add support to the [Figaro](https://rubygems.org/gems/figaro) gem, a simple, Heroku-friendly Rails app configuration using ENV and a single YAML file.

### Template Engine
We choose to use [Slim](http://slim-lang.com) as the default template engine by using the [Slim Rails](https://rubygems.org/gems/slim-rails) gem.

### Test Framework (optional)
We optionally add support to [Rspec](http://rspec.info) by using the [Rspec Rails](https://rubygems.org/gems/rspec-rails) gem.

### Assets
#### CSS Framework (optional)
Here we optionally add support to [Bourbon](http://bourbon.io) Sass mixins and [Neat](http://neat.bourbon.io), a lightweight semantic grid framework for Sass and Bourbon. Style normalization, thanks to [normalize.css](https://github.com/necolas/normalize.css), and some common Sass rules based on [Refills](http://refills.bourbon.io/) components and patterns are added too.

#### Fonts (optional)
And if wanted, we also add support to [FontAwesome](http://fontawesome.io) by using the [FontAwesome Rails](https://rubygems.org/gems/font-awesome-rails) gem.

### Layout
A minimal `applicaiton.slim` layout using `_header.slim` and `_footer.slim` partials is implemented. The header will contain locale switches and the footer display author credits. This layout is well integrated with the CSS framework if you opt in for it.

### Locale (optional)
You'll be asked for which locales you want to install and configure. The available choices are listed in the [Rails i18n](https://github.com/svenfuchs/rails-i18n#available-locales) `README.md` file. These locales will be downloaded from this repo and automatically available in your project and added to the `_header.slim` partial layout's locale switches.

### DRY
We also add a set of [Rails Responders](https://github.com/plataformatec/responders) to dry up our application.

### Root
Finally, we create and configure a `welcome#home` root action. You can choose another name for this action during the install process.

## Troubleshooting
### Rspec:install never end
This issue seems to be due to [Spring](https://rubygems.org/gems/spring). You can find more details on this issue [here](https://github.com/rails/spring/issues/265). Here is how to fix it :

`cd` your new aborted Rails project directory and run

```shell
$ spring stop
$ bin/spring
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
