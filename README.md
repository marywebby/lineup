# Line Up #
## Description 📖
LineUp offers a streamlined and user-friendly solution to the common challenges of managing skincare routines. This innovative platform enables users to effortlessly create and manage their personalized skincare routines with simplicity and precision. By providing an option to generate a step-by-step guide, LineUp ensures that users apply their products in the optimal order, enhancing the effectiveness of their skincare regimen. Additionally, LineUp integrates the powerful capabilities of OpenAI's API, making it easy for users to discover and tailor their own personal lineup based on intelligent recommendations and real-time advice. This integration not only simplifies the process of routine creation but also enriches the user experience by adapting to individual skincare needs and preferences.
  
## Table of Contents 📚

- [Main Features](#main-features-📲)
- [Technologies Used](#technologies-used-⚙️)
- [Services Used](#services-used-⛓️)
- [Installation](#installation-🛠️)
- [Contribution Guidelines](#contribution-guidelines-🧑‍🔧)
- [FAQ](#faq-🙋)

## Main Features 📲

### **Product Browsing**: 
Users are able to search through existing products in the catalog to get further information about each one. Users are also able to submit and send in products that they love that they want to see in the database. 
<div>
  <img src="product-browsing.gif" alt="Alt text" width="500" height="300">
</div>

### **Routine Creation**: 
Users are able to title their own routines and select specific products they want placed into it. 
<div>
  <img src="routine-creation.gif" alt="Alt text" width="500" height="300">
</div>

### **LineUp Generation**: 
Users are able to easily click "generate routine" on the specific routine, and in return, OpenAI's API will generate the line up of what order they should use each of the products in. 
<div>
  <img src="generating-lineup.gif" alt="Alt text" width="500" height="300">
</div>


## Technologies Used ⚙️

### Ruby Version
- Ruby version: `3.2.1`
- Rails version: `7.0.4.3`
- Tailwind CSS Rails `2.4`
- Bootstrap `5.3.3`

### Additonal gems added to applications 
- [`appdev_support`](https://github.com/firstdraft/appdev_support)
- [`annotate`](https://github.com/ctran/annotate_models)
- [`awesome_print`](https://github.com/awesome-print/awesome_print)
- [`better_errors`](https://github.com/BetterErrors/better_errors)
- [`binding_of_caller`](https://github.com/banister/binding_of_caller)
- [`dotenv-rails`](https://github.com/bkeepers/dotenv)
- [`draft_generators`](https://github.com/firstdraft/draft_generators/)
- [`draft_matchers`](https://github.com/jelaniwoods/draft_matchers/)
- [`devise`](https://github.com/heartcombo/devise)
- [`faker`](https://github.com/faker-ruby/faker)
- [`grade_runner`](https://github.com/firstdraft/grade_runner/)
- [`htmlbeautifier`](https://github.com/threedaymonk/htmlbeautifier/)
- [`http`](https://github.com/httprb/http)
- [`pry_rails`](https://github.com/pry/pry-rails)
- [`rails_db`](https://github.com/igorkasyanchuk/rails_db)
- [`rails-erd`](https://github.com/voormedia/rails-erd)
- [`rspec-html-matchers`](https://github.com/kucaahbe/rspec-html-matchers)
- [`rspec-rails`](https://github.com/rspec/rspec-rails)
- [`rufo`](https://github.com/ruby-formatter/rufo)
- [`specs_to_readme`](https://github.com/firstdraft/specs_to_readme)
- [`table_print`](https://github.com/arches/table_print)
- [`web_git`](https://github.com/firstdraft/web_git)
- [`webmock`](https://github.com/bblimke/webmock)
- [`simple_form`](https://github.com/heartcombo/simple_form)
- [`pundit`](https://github.com/varvet/pundit)
- [`csv`](https://github.com/ruby/csv)
- [`kaminari`](https://github.com/kaminari/kaminari)
- [`ransack`](https://github.com/activerecord-hackery/ransack)
- [`rails_admin`](https://github.com/railsadminteam/rails_admin)
- [`sassc-rails`](https://github.com/sass/sassc-rails)
- [`sprocket_rails`](https://github.com/rails/sprockets-rails)

## Services Used ⛓️

### **OpenAI ChatGPT API**

### Configuration

To configure your application to use the ChatGPT's OpenAI API, follow these detailed steps:

#### 1. Generate a Master Key
If you do not already have a `master.key` file, you can generate one by running:
```bash
EDITOR="code --wait" rails credentials:edit
```

This command will open the credentials file in Visual Studio Code (replace "code --wait" with your preferred editor, nano is also another tool), and a new master.key file will be generated automatically if it does not exist.

#### 2. Add OpenAI API's Tokens
Inside the opened credentials file, add your API tokens and other sensitive configuration variables in a structured format. For example:

```yaml
  open_ai_api_key: YOUR_OPENAI_API_ACCESS_KEY
```

Save and close the file. The changes will be encrypted and saved securely, accessible only via the master.key.

#### 3. Double check your configuration 
If you would like to periodically check your key for reference you can run the command below and it should appear in your terminal.
```bash
rails credentials:show
```

#### 3. Ensure the Security of the Master Key
Never commit your master.key or the credentials file to version control. Add the master.key to your .gitignore file to prevent it from being accidentally pushed to your repository:
```bash
echo 'config/master.key' >> .gitignore
```

## Installation 🛠️

### Current Main Branch: rails 7 
* Clone the repository and switch to the main branch
* Run the following commands

```sh
bundle install
rails db:migrate
rails slurp:reset
rails slurp:type_of_products
rails slurp:products
rails slurp:ingredients
rake sample_data
bin/dev
```
After running the above commands you will have generated all the data needed to see the app functioning. The user Alice will have access, you can sign in with:

* Email: ``alice@example.com``
* Password: ``password``

Or make your own personal account by signing up!

## Contribution Guidelines 🧑‍🔧

### Introduction
Thank you for your interest in contributing to **LineUp**. This document provides guidelines and instructions on how to contribute to the project.

### How to Contribute
1. **Setup your environment**: Follow the installation instructions above.

[Github Project Link](https://github.com/users/marywebby/projects/4)

2. **Find an issue to work on**: In the Projects tab, check out our issues, we continue to add new issues frequently so feel free to create your own issues as well.
 
### Coding Conventions
We adhere to the Ruby community style guide, and we expect all contributors to follow suit. Here are key conventions specific to our project:

- **Code Style**: Follow the [Ruby Style Guide](https://rubystyle.guide/), which provides detailed guidelines on the coding style preferred by the Ruby community.
- **Naming Conventions**:
  - Use `snake_case` for variables, methods, and file names.
  - Use `PascalCase` for class and module names.
  - Reflect domain concepts accurately in naming. For instance, if you are working within a financial application, prefer names like `user_account_details` over vague terms like `data`.

- **Design Principles**: Focus on Domain-Driven Design (DDD):
  - Organize code to reflect the domain model clearly.
  - Use service objects, decorators, and other design patterns that help isolate domain logic from application logic.

### Comments and Documentation
- **Comment your code** where necessary to explain "why" something is done, not "what" is done—source code should be self-explanatory regarding the "what".
- **Document methods and classes** thoroughly, focusing on their roles within the domain model, especially for public APIs.

### Version Control Practices
- Commit messages should be clear and follow best practices, such as those outlined in [How to Write a Git Commit Message](https://chris.beams.io/posts/git-commit/).
- Keep commits focused on a single issue to simplify future maintenance and troubleshooting.

### Branch Naming Conventions
Please use the following naming conventions for your branches:

- `<initals-issue#-description>` (i.e mcw-31-added-pagination)

### Pull Request Process
1. **Creating a Pull Request**: Provide a detailed PR description, referencing the issue it addresses.
2. **Review Process**: PRs require review from at least one maintainer.

### Community and Communication
Join our [Discord](https://discord.gg/ZnZCT9W8wD) to communicate with other contributors and maintainers.

Thank you for contributing to **LineUP**!

## FAQ 🙋
### Master Key Errors
* Be sure to follow the [Configuration Instructions](#configuration) if you encounter an issue when setting up the project.

### OpenAI API Configuration
* For help with how to use the ChatGPT's OpenAI API, see the [documentation here.](https://platform.openai.com/docs/introduction)

### Ruby Version Errors
* The project is written using Ruby 3.2.1, if you encounter issues upon cloning, make sure you have Ruby version 3.2.1 in your environment, also see the [Ruby Language docs.](https://www.ruby-lang.org/en/documentation/)
