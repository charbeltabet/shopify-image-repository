# Shopify Image Repository Challenge - 2022

The API features:
- **Images** on which **actions** can be taken such as:
  - CRUD, attachment view,
  - publicize,
  - privatized,
  - transfer_ownership

- **ProtectedActions** who belong to **images** for:
  - keeping track of **actions** that can only be performed by the image owner such as `:update` and `:destroy`

- **Users** authentified using API Key who:
  - own images,
  - own `GrantedAccesses` to other users images,

- **GrantedAccesses** who belong to other **users** and assigned by the image's owner for:
  - keeping track of what **ProtectedActions** can a user who doesn't own an **image** perform on it.

Images are stored using the rails's default `active_storage_attachments`, user's permissions and accesses are handled using two tables, `protected_actions` and `granted_accesses` that associate references of the `users` and `images` tables to the image controller `actions`.

An OpenApi interface that allows to consume and visualize the RESTful web service is available at: https://shopify-image-repository.herokuapp.com/

Instructions on installation and usage follow.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Support](#support)
- [Contributing](#contributing)

## Installation

### Local installation
Make sure you have ruby, postgres and their dependencies installed on your system and then do:

```sh
bundle install
rake db:setup
rails s
```

If you change the rswag documentation, run `rails rswag` for your changes to take effect.

### Heroku
Alternatively, I recommend deploying to heroku:
- fork the repository,
- access your heroku account,
- use [heroku's github integration](https://devcenter.heroku.com/articles/github-integration) on your fork.

## Usage
Enter https://shopify-image-repository.herokuapp.com/ to view the available and documented endpoints. The api documentation allows you to send http requests to the listed endpoints. Alternatively, you can use any http client or api development tool. 

Feel free to remove any sections that aren't applicable to your project.

## Support

Please [open an issue](https://github.com/charbeltabet/shopify-image-repository/issues/new) for support.

## Contributing

Please contribute using [Github Flow](https://guides.github.com/introduction/flow/). Create a branch, add commits, and [open a pull request](https://github.com/charbeltabet/shopify-image-repository/compare/).