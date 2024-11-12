<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <title>Giỏ hàng của bạn</title>
    <link rel="stylesheet" href="css/bds.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        ul {
            list-style-type: none;
            padding: 0;
            margin-right: 0;
            border-radius: 10px;
        }

        .u-lo li {
            position: relative;
            display: inline-block;
            margin-right: 20px;
            z-index: 10; /* Đảm bảo menu cha hiển thị trên cùng */
        }

        ul li a {
            text-decoration: none;
            display: inline-block;
            color: #333;
        }

        /* Thiết lập cho menu con */
        ul li ul {
            display: none; /* Ẩn menu con mặc định */
            position: absolute;
            top: 100%;
            left: 0;
            background-color: #f9f9f9;
            min-width: 200px;
            padding: 10px 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            z-index: 999; /* Đảm bảo menu con hiển thị trên các phần tử khác */
        }

        ul li ul li {
            display: block;
            margin: 0;
        }

        ul li ul li a {
            padding: 10px 15px;
            color: #333;
            display: block;
        }

        /* Hiển thị menu con khi hover */
        ul li:hover ul {
            display: block;
        }

        /* Style cho menu con khi hover */
        ul li ul li a:hover {
            background-color: #eee;
            text-decoration: none;
        }

        .main-content {
            padding: 20px;
            max-width: 800px;
            margin: 0 auto;
        }

        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }

        .cart-item {
            display: flex;
            align-items: center;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 10px;
            margin-bottom: 15px;
            position: relative;
            cursor: pointer; /* Con trỏ chuột sẽ thành dạng pointer khi hover */


        }

        .cart-item {
            display: flex;
            align-items: center;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 10px;
            margin-bottom: 15px;
            position: relative;
        }

        .item-content {
            display: flex;
            align-items: center;
            flex: 1;
        }

        .cart-item img {
            width: 200px;
            height: 200px;
            border-radius: 8px;
            object-fit: cover;
            margin-right: 15px;
        }

        .item-info {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .remove-button {
            background-color: transparent;
            border: none;
            color: #d9534f;
            font-size: 16px;
            cursor: pointer;
            margin-left: 10px;
        }

        .remove-button:hover {
            color: #a94442;
        }


        #checkout-button {
            background-color: #5cb85c;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            display: block;
            margin: 20px auto;
            text-align: center;
            width: 100%;
        }

        #checkout-button:hover {
            background-color: #4cae4c;
        }
        .cart-item .price, .cart-item .area {
            color: #d9534f; /* Màu đỏ */
            font-weight: bold;
        }

    </style>
</head>
<header class="header">
    <div class="header-top" style="width: 100%; position: sticky; top: 0; z-index: 1000;">
        <div class="header-left">

            <div class="contact-item">
                <img src="jpg/phone-call.png" class="icon">
                <span>0123 456 789</span>
            </div>
            <div class="contact-item">
                <img src="jpg/email.png" class="icon">
                <span>info@company.com</span>
            </div>
            <div class="contact-item">

                <img src="jpg/location.png" class="icon">
                <span>123 Đường ABC, Quận XYZ, TP.HCM</span>
            </div>

        </div>
        <%
            boolean isLoggedIn = session.getAttribute("username") != null;
            String username = (String) session.getAttribute("username");
        %>

        <div class="header-right" style="margin-top: 10px">
            <% if (isLoggedIn) { %>
            <a href="account.jsp" class="btn">
                <h3 style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 150px;">
                    Hello, <%= username %>
                </h3>
            </a>

            <a href="javascript:void(0)" id="logoutButton" class="btn">
                <h3>Đăng xuất</h3>
            </a>
            <% } else { %>
            <a href="login.jsp" class="btn"><h3>Đăng nhập</h3></a>
            <a href="register.jsp" class="btn"><h3>Đăng ký</h3></a>
            <% } %>
            <a href="post-status.html" class="btn"><h3>Đăng tin</h3></a>
        </div>




    </div>
    <div class="menu">
        <div class="header-bottom">

            <div class="store-name">
                <h1><a href="welcome">
                    <span class="color1">HOME</span>
                    <span class="color2">LANDER</span> <!-- Đổi từ VINA BOOK sang VINA BĐS -->
                </a></h1>
            </div>


            <nav>
                <ul class="u-lo">
                    <li><a href="property-for-sale.html">Nhà Đất Bán</a>
                        <ul>
                            <li><a href="#">Thông tin bán nhà đất</a></li>
                            <li><a href="#">Mua bán bất động sản</a></li>
                            <li><a href="#">Nhà đất giá rẻ</a></li>
                        </ul>
                    </li>
                    <li><a href="property-for-rent.html">Nhà Đất Cho Thuê</a>
                        <ul>
                            <li><a href="#">Thông tin cho thuê nhà đất</a></li>
                            <li><a href="#">Thuê nhà nguyên căn</a></li>
                            <li><a href="#">Thuê căn hộ giá rẻ</a></li>
                        </ul>
                    </li>
                    <li><a href="project.html">Dự Án</a>
                        <ul>
                            <li><a href="#">Các dự án nổi bật</a></li>
                            <li><a href="#">Dự án nhà ở</a></li>
                            <li><a href="#">Dự án chung cư</a></li>
                        </ul>
                    </li>
                    <li><a href="news.html">Tin Tức</a>
                        <ul>
                            <li><a href="#">Tin thị trường</a></li>
                            <li><a href="#">Xu hướng bất động sản</a></li>
                            <li><a href="#">Phân tích và đánh giá</a></li>
                        </ul>
                    </li>
                    <li><a href="wiki.html">Wiki BĐS</a>
                        <ul>
                            <li><a href="#">Mua bán</a></li>
                            <li><a href="#">Cho thuê</a></li>
                            <li><a href="#">Tài chính</a></li>
                            <li><a href="#">Phong thủy</a></li>
                        </ul>
                    </li>
                </ul>

            </nav>


            <div class="contact-info">
                <img src="jpg/phone-call.png" alt="Phone Icon" class="phone-icon">
                <span class="phone-number">0123 456 789</span>
            </div>

        </div>
    </div>


</header>

<body>
<div class="main-content">

    <h1>Giỏ hàng bất động sản của bạn</h1>
    <ul id="cart-items" class="cart-list">

    </ul>
    <button id="checkout-button" onclick="window.location.href='checkout.jsp'">Đặt lịch</button>
</div>

<script>
    let cartItems = JSON.parse(sessionStorage.getItem('cartItems')) || [];

    // Function to add items to the cart
    function addToFavorites(id, title, price, area, imageUrl, address) {
        const existingProductIndex = cartItems.findIndex(item => item.id === id);

        if (existingProductIndex !== -1) {
            alert("Bất động sản này đã được quan tâm!");
        } else {
            const product = {
                id,
                title,
                price: parseFloat(price),
                area,
                imageUrl,
                address,
                quantity: 1
            };
            cartItems.push(product);
            updateSessionStorage();
            updateCartDisplay();
            saveCartToDatabase();
        }
    }

    // Update sessionStorage with the cart items
    function updateSessionStorage() {
        sessionStorage.setItem('cartItems', JSON.stringify(cartItems));
    }

    // Update the cart display in the mini cart
    function updateCartDisplay() {
        const cartList = document.getElementById('cart-items');
        const checkoutButton = document.getElementById('checkout-button');
        cartList.innerHTML = ''; // Clear previous cart items

        if (cartItems.length === 0) {
            cartList.innerHTML = '<li>Giỏ hàng của bạn đang trống.</li>';
            checkoutButton.disabled = true; // Disable the checkout button when the cart is empty
            checkoutButton.style.opacity = "0.5"; // Reduce opacity to show button is disabled
            return;
        }

        checkoutButton.disabled = false;
        checkoutButton.style.opacity = "1";

        cartItems.forEach((item) => {
            const listItem = document.createElement('li');
            listItem.classList.add('cart-item');
            listItem.innerHTML = `
            <div class="item-content">
                <img src="${item.imageUrl}" alt="${item.title}" class="clickable-image">
                <div class="item-info">
                    <h4>${item.title}</h4>
                    <p><i class="fas fa-map-marker-alt"></i> Địa chỉ: ${item.address}</p>
                    <p class="area"><i class="fas fa-ruler-combined"></i> Diện tích: ${item.area} m²</p>
                    <p class="price"><i class="fas fa-dollar-sign"></i> Giá: ${item.price.toLocaleString()} tỷ</p>
                </div>
            </div>
            <button class="remove-button" onclick="removeFromCart('${item.id}')">
                <i class="fas fa-trash-alt"></i> Xóa
            </button>
        `;

            listItem.querySelector('.clickable-image').addEventListener('click', function (event) {
                event.stopPropagation();
                window.location.href = `property-detail.jsp?id=${item.id}`;
            });

            cartList.appendChild(listItem);
        });
    }

    // Remove item from the cart
    function removeFromCart(id) {
        cartItems = cartItems.filter(item => item.id !== id);
        updateSessionStorage();
        updateCartDisplay();
    }

    // Save the cart to the database via AJAX
    function saveCartToDatabase() {
        const userId = sessionStorage.getItem("userId");
        if (userId) {
            fetch('/saveCart', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ userId, cartItems })
            })
                .then(response => response.json())
                .then(data => {
                    console.log("Response from saveCart:", data); // Add this to confirm response
                    if (data.success) {
                        console.log("Giỏ hàng đã được lưu vào cơ sở dữ liệu.");
                    } else {
                        console.error("Lỗi khi lưu giỏ hàng.");
                    }
                })
                .catch(error => console.error("Có lỗi xảy ra:", error));
        }
    }

    // Logout and clear cart
    function logout() {
        sessionStorage.removeItem('cartItems'); // Remove cart from session
        const userId = sessionStorage.getItem('userId');

        if (userId) {
            fetch('/logout', {
                method: 'POST',
                body: JSON.stringify({ userId }),
                headers: { 'Content-Type': 'application/json' }
            })
                .then(response => {
                    if (response.ok) {
                        console.log("Giỏ hàng đã được xóa khỏi cơ sở dữ liệu.");
                    } else {
                        console.error("Không thể xóa giỏ hàng từ cơ sở dữ liệu.");
                    }
                })
                .catch(error => console.error("Có lỗi xảy ra khi xóa giỏ hàng:", error));
        }

        // Redirect to the home page after logout
        window.location.href = 'homes';
    }

    // Add event listener for logout button
    document.querySelector("#logoutButton").addEventListener("click", logout);

    // Initial cart display
    updateCartDisplay();

</script>
<div class="footer">
    <div class="footer-top">

        <h1><a href="homes">
            <span class="color1">HOME</span>
            <span class="color2">LANDER</span>
        </a></h1>
        <span class="footer-item"><i class="fas fa-phone"></i> Hotline: 0123 456 789</span>
        <span class="footer-item"><i class="fas fa-envelope"></i> Hỗ trợ: support@batdongsan.com</span>
        <span class="footer-item"><i class="fas fa-headset"></i> Chăm sóc: 0987 654 321</span>
    </div>

    <div class="footer-content">
        <!-- Thông tin công ty -->
        <div class="company-info">
            <h3>Công ty Bất Động Sản</h3>
            <p>Địa chỉ: 123 Đường ABC, Quận 1, TP.HCM</p>
            <p>Điện thoại: 0123 456 789</p>
        </div>

        <!-- Liên kết nhanh -->
        <div class="quick-links">
            <h3>Liên kết nhanh</h3>
            <ul>
                <li><a href="#">Trang chủ</a></li>
                <li><a href="#">Dự án</a></li>
                <li><a href="#">Tin tức</a></li>
                <li><a href="#">Liên hệ</a></li>
            </ul>
        </div>

        <!-- Mạng xã hội -->
        <div class="social-media">
            <h3>Mạng xã hội</h3>
            <a href="https://www.facebook.com/khoa.ngo.562114/" class="social-icon"><i class="fab fa-facebook"></i>
                Facebook</a>
            <a href="https://www.instagram.com/khoa5462/" class="social-icon"><i class="fab fa-instagram"></i>
                Instagram</a>
            <a href="https://mail.google.com/mail/u/0/?hl=vi#inbox" class="social-icon"><i
                    class="fas fa-envelope"></i>
                Mail</a>
        </div>

        <!-- Form nhập email -->
        <div class="newsletter">
            <h3>Đăng ký nhận tin tức mới nhất</h3>
            <form action="#" method="POST">
                <input type="email" name="email" placeholder="Nhập email của bạn" required>
                <button type="submit">Đăng ký</button>
            </form>
        </div>
    </div>

    <div class="footer-bottom">
        <p>&copy; 2024 Công ty Bất Động Sản. Mọi quyền lợi thuộc về công ty.</p>
    </div>


</div>

</body>
</html>