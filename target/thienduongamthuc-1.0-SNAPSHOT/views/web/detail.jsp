<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Product Page</title>
  <style>
    /* Reset default margin and padding */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    /* Basic styles for header and navigation */
    header {
      background-color: #333;
      color: #fff;
      padding: 20px 0;
      text-align: center;
    }

    nav ul {
      list-style: none;
    }

    nav ul li {
      display: inline;
      margin-right: 20px;
    }

    nav ul li a {
      color: #fff;
      text-decoration: none;
    }

    /* Container styles */
    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 20px;
    }

    /* Product details section */
    .product-details {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      padding: 20px 0;
    }

    .product-images img {
      max-width: 100%;
      height: auto;
      border: 1px solid #ddd;
      padding: 10px;
    }

    .product-info {
      flex: 0 0 60%;
      padding-left: 20px;
    }

    h1, p {
      margin-bottom: 10px;
    }

    .stars {
      color: gold;
    }

    .quantity {
      margin-top: 15px;
    }

    button {
      padding: 10px 20px;
      background-color: #333;
      color: #fff;
      border: none;
      cursor: pointer;
    }

    button:hover {
      background-color: #555;
    }

    /* Related products section */
    .related-products {
      background-color: #f5f5f5;
      padding: 40px 0;
      text-align: center;
    }

    .product-list {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 20px;
    }

    .product {
      width: 250px;
      padding: 20px;
      background-color: #fff;
      border: 1px solid #ddd;
      text-align: center;
    }
  </style>
</head>
<body>

<header>
  <!-- Include header content -->
  <nav>
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">Products</a></li>
      <li><a href="#">Contact</a></li>
    </ul>
  </nav>
</header>

<main class="container">
  <section class="product-details">
    <div class="product-images">
      <img src="product_image.jpg" alt="Product Image">
      <!-- More images can be included here -->
    </div>

    <div class="product-info">
      <h1>Product Name</h1>
      <p>Description of the product. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
      <p>Price: $XX.XX</p>
      <p>Available in different sizes/colors.</p>
      <p>Rating: <span class="stars">?????</span></p>
      <div class="quantity">
        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" min="1" value="1">
      </div>
      <button onclick="addToCart()">Add to Cart</button>
    </div>
  </section>
</main>

<section class="related-products">
  <div class="container">
    <h2>Related Products</h2>
    <div class="product-list">
      <!-- Repeat this block for each related product -->
      <div class="product">
        <img src="related_product_image.jpg" alt="Related Product Image">
        <h3>Related Product Name</h3>
        <p>Price: $XX.XX</p>
        <button>View Details</button>
      </div>
      <div class="product">
        <img src="related_product_image.jpg" alt="Related Product Image">
        <h3>Related Product Name</h3>
        <p>Price: $XX.XX</p>
        <button>View Details</button>
      </div>
      <!-- Add more related products -->
    </div>
  </div>
</section>

<footer>
  <!-- Include footer content -->
  <p>&copy; 2023 Your Company</p>
</footer>

<script>
  // JavaScript functions
  function addToCart() {
    // This function can be extended to perform actions when adding to the cart
    alert('Added to cart!');
    // Additional logic to update cart items or perform other actions can be added here
  }
</script>

</body>
</html>

