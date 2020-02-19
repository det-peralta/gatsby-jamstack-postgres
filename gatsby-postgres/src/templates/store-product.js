import React, { Component } from "react"
import { graphql } from "gatsby";
import Layout from "../components/layout";

export default ({ data }) => {
  
  const { product } = data.postgres;
  const url = 'https://localhost:5001/api/products/' + product.id;

  return (
    <Layout>
      <div>
        <h1>{product.title}</h1>
        <h3>
          {product.createdAt}
        </h3>
        <p id={product.id}><b>Código:</b> {product.id}</p>
        <p><b>Descrição:</b> {product.body}</p>
        <Stock url={url} />
        <p><b>Preço:</b> €{product.price}</p>
      </div>
    </Layout>
  );
};

export const query = graphql`
  query($productId: Int!) {
    postgres {
      product: productById(id: $productId) {
        id
        title
        body
        price
        stock
        createdAt
        author: userByAuthorId {
          id
          username
        }
      }
    }
  }
`;

class Stock extends Component {

  state = {
    loading: true,
    error: false,
    fetchedData: [],
  }

  componentDidMount() {
    fetch(this.props.url)
      .then(response => {

        return response.json();
      })
      .then(json => {
        this.setState({
          fetchedData: json,
          loading: false,
        })
      })
  }


  render() {

    const { loading, fetchedData } = this.state

    return (
      <div className="container">
        {loading ?
          (<p>LOADING...</p>)
          :
          (<p key={fetchedData}> {fetchedData ? "Disponivel" : "Indisponvel"} </p>)
        }
      </div>
    )
  }
}
