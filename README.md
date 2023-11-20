# Customer Support API

This API provides endpoints for managing customer support tickets. It uses Devise Token Auth for user authentication.

## Getting Started

These instructions will help you set up and run the Customer Support API on your local machine.

### Prerequisites

- Ruby
- Rails
- PostgreSQL
- Devise Token Auth gem

### Installation

1. Clone the repository:

    ```bash
    git clone git@githubcom:Stoyan83customer-support-api.git
    cd customer-support-api
    ```

2. Install dependencies:

    ```bash
    bundle install
    ```

3. Set up the database:

    ```bash
    rails db:create
    rails db:migrate
    ```

4. Start the server:

    ```bash
    rails s
    ```

## API Endpoints

### Authentication

- **Register User:**

    ```http
    POST /auth
    ```

    Register a new user. Requires `email` and `password` parameters.

- **Login User:**

    ```http
    POST /auth/sign_in
    ```

    Log in an existing user. Requires `email` and `password` parameters.

- **Logout User:**

    ```http
    DELETE /auth/sign_out
    ```

    Log out the currently authenticated user.

## Authentication Headers

Make sure to include the following headers in your requests:

```http
Headers:
  Content-Type: application/json
  Access-Token: <your-access-token>
```
