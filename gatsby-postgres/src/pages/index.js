import React from "react";
import { Link, graphql } from "gatsby";

import Layout from "../components/layout";
import slugifyPost from "../../slugifyPost";

const IndexPage = ({ data }) => (
  <Layout>
    <h1>Lista de Produtos</h1>
    <ul>
      {data.postgres.products.map(product => (
        <li key={product.id}>
          <strong>
            <Link to={slugifyPost(product)}>{product.title}</Link>
          </strong>{" "}
          by <em>{product.author.username}</em>
        </li>
      ))}
    </ul>

  </Layout>
);

export const query = graphql`
  {
    postgres {
      products: allProductsList {
        id
        author: userByAuthorId {
          id
          username
        }
        title
      }
    }
  }
`;

export default IndexPage;
