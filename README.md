# TodoMVC using Rails/Hotwire

This repo is a standard Rails & Hotwire application showing what can be done in the frontend without any
custom Javascript.

Like the examples on https://todomvc.com except this one is actually a full stack application with persistence and
everything.

| Feature                  | Rails/Hotwire                         | Frontend Frameworks                     |
|--------------------------|---------------------------------------|-----------------------------------------|
| Persistence              | Yes                                   | Depends on backend integration          |
| Frontend Updates         | Yes (via Hotwire)                     | Yes                                     |
| Works with JS turned off | Yes                                   | No                                      |
| Complexity               | Lower                                 | Higher                                  |
| Custom Javascript        | Not required                          | Required                                |
| Learning Curve           | Easier for Rails developers           | Steeper, especially for backend devs    |
| Performance              | Good, with server-side rendering      | Good, with client-side rendering        |
| SEO                      | Better, due to server-side rendering  | Requires additional setup for SSR       |


## Setup

To run the application in development mode, follow these steps:

1. **Clone the repository:**
  ```sh
  git clone https://github.com/garyharan/todomvc_rails.git
  cd todomvc_rails
  ```

2. **Install dependencies:**
  ```sh
  bundle install
  yarn install
  ```

3. **Set up the database:**
  ```sh
  rails db:create
  rails db:migrate
  ```

4. **Start the Rails server:**
  ```sh
  rails server
  ```

5. **Visit the application:**
  Open your web browser and go to `http://localhost:3000`.

You should now see the TodoMVC application running in development mode.
