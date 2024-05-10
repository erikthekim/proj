
#  Headcount

## Description
Headcount is a Ruby on Rails application designed to manage party events where users can post about upcoming parties, vote on them, and view party details. Administrators can manage posts and user activities.

## Features
- **User Authentication:** Allows users to sign up, log in, and log out.
- **Party Management:** Users can create, update, and delete party posts.
- **Voting System:** Users can vote on parties to show interest.
- **Admin Dashboard:** Admins can view, edit, and delete all user posts and manage user accounts.

## Technology Stack
- **Framework:** Ruby on Rails
- **Database:** SQLite3
- **Frontend:** HTML, CSS, JavaScript, Tailwind CSS

## Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/headcount.git
   cd headcount
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Set up the database**
   ```bash
   rails db:create
   rails db:migrate
   ```

4. **Start the server**
   ```bash
   rails server
   or
   bin/dev 
   ```

5. **Visit the application**
   Open `http://localhost:3000` in your browser.

## Configuration
Ensure that your database and other environment-specific settings are configured in the `config/database.yml` and `config/secrets.yml` files respectively.

## Usage
After starting the server, you can:
- Register a new user account.
- Log in with existing credentials.
- Create, update, or delete party posts.
- Vote on parties.
- Access the admin dashboard if you have admin credentials.

### Notes
- **Customize the Template:** Modify the contents to match the specifics of your project. If there are special requirements or additional setup steps, make sure to include them.
- **GitHub Features:** If you are hosting the repository on GitHub, take advantage of Markdown features like badges for build status, dependency versions, etc.
- **Licensing:** Be sure to choose a license that matches your project's needs. The MIT license is commonly used for open source projects, but your requirements might differ.
