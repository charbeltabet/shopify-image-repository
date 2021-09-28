# Shopify Image Repository Challenge - 2022

The API features:
- **Images** on which **actions** can be taken such as:
  - CRUD, attachment view,
  - publicize,
  - privatized,
  - transfer_ownership

- **ProtectedActions** who belong to **images** used for:
  - **actions** that can only be performed by the user who is the image's owner. such as `:update` and `:destroy`

- **Users** authentified using API Key who:
  - own images,
  - own `GrantedAccesses` to other users images,

- **GrantedAccesses** who belong to other **users** and assigned by the image's owner for:
  - keeping track of what **ProtectedActions** can a user who doesn't own an **image** perform on it.

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
Enter https://shopify-image-repository.herokuapp.com/ to view the available and documented endpoints.

Feel free to remove any sections that aren't applicable to your project.

## Support

Please [open an issue](https://github.com/charbeltabet/shopify-image-repository/issues/new) for support.

## Contributing

Please contribute using [Github Flow](https://guides.github.com/introduction/flow/). Create a branch, add commits, and [open a pull request](https://github.com/charbeltabet/shopify-image-repository/compare/).
