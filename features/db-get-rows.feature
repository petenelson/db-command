Feature: Select rows from the database with WordPress' MySQL config

  Scenario: Get a list of post IDs in table format using a custom query
    Given a WP install

    When I run `wp db get-rows "SELECT ID as post_id FROM wp_posts;"`
    Then STDOUT should be a table containing rows:
      | post_id |
      | 1       |
      | 2       |
      | 3       |

  Scenario: Get a list of posts in CSV format using a custom query
    Given a WP install

    When I run `wp db get-rows "SELECT ID as post_id, post_name as slug FROM wp_posts;" --format=csv`
    Then STDOUT should contain:
      """
      post_id,slug
      1,hello-world
      2,sample-page
      3,privacy-policy
      """
