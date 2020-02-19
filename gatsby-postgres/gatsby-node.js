/**
 * Implement Gatsby's Node APIs in this file.
 *
 * See: https://www.gatsbyjs.org/docs/node-apis/
 */

const path = require('path');
const slugifyPost = require('./slugifyPost');

exports.createPages = async ({graphql, actions: { createPage}}) => {
  const result = await graphql(`
  {
    postgres {
      products: allProductsList {
        id
        title
      }
    }
  }
  `)

  result.data.postgres.products.forEach(product => {
    createPage({
      path: slugifyPost(product),
      component: path.resolve('./src/templates/store-product.js'),
      context: {
        productId: product.id,
      },
    });
  });

}
