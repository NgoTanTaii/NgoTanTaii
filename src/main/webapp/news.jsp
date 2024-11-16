<!DOCTYPE html>
<html lang="en">
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/bds.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
        }

        .news-container {
            display: flex;
            max-width: 80%;
            margin: 20px auto;
            gap: 20px;

        }

        .main-news {

            flex: 3;
            position: relative;
            overflow: hidden;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .main-news-image {
            width: 100%;
            height: 390px;
            display: block;
        }

        .main-news-content {
            position: absolute;
            bottom: 20px;
            left: 20px;
            color: white;
            background: rgba(0, 0, 0, 0.5);
            padding: 10px 15px;
            border-radius: 5px;
        }

        .date {
            font-size: 12px;
            opacity: 0.8;
        }

        .main-news-title {
            font-size: 24px;
            margin: 5px 0;
        }

        .main-news-description {
            font-size: 14px;
            line-height: 1.5;
        }

        .side-news {
            flex: 0.5;
            background-color: white;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .most-viewed {
            flex: 0.5;
            background-color: white;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .side-news h3, .most-viewed h3 {
            font-size: 18px;
            margin-bottom: 10px;
            color: #333;
        }

        .side-news-list, .most-viewed-list {
            list-style-type: none;
            font-size: 14px;
        }

        .side-news-list li, .most-viewed-list li {
            margin-bottom: 8px;
        }

        .side-news-list li a, .most-viewed-list li a {
            text-decoration: none;
            color: #0073e6;
            transition: color 0.2s ease;
        }

        .side-news-list li a:hover, .most-viewed-list li a:hover {
            color: #005bb5;
        }

        .articles-container {
            max-width: 54%;
            display: flex;
            flex-direction: column;
            gap: 20px;
            margin-left: 128px;
        }

        .article-item {
            display: flex;
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);

        }

        .article-image {
            position: relative;
            width: 300px !important;
            height: 200px !important;

        }

        .article-image img {
            width: 180px;
            height: 250px;
            object-fit: cover;
        }

        .tag {
            position: absolute;
            top: 10px;
            left: 10px;
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 5px 10px;
            font-size: 12px;
            border-radius: 5px;
        }

        .article-content {
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .date {
            font-size: 12px;
            color: #888;
        }

        .article-title {
            font-size: 20px;
            margin: 10px 0;
            color: #333;
        }

        .article-description {
            font-size: 14px;
            color: #555;
            line-height: 1.6;
        }

        .tags {
            margin-top: 10px;
        }

        .tags span {
            background-color: #e9e9e9;
            color: #555;
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 12px;
            margin-right: 10px;
            display: inline-block;
        }

        .see-more {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }

        .see-more button {
            background-color: #007bff; /* Button color */
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .see-more button:hover {
            background-color: #0056b3; /* Hover color */
        }

    </style>
</head>
<body>
<header class="header">
    <div class="header-top" style="width: 100%; position: sticky; top: 0; z-index: 1000;">
        <div class="header-left">

            <div class="contact-item">
                <img src="jpg/phone-call.png" class="icon">
                <span>0123 456 789</span>
            </div>
            <div class="contact-item">
                <img src="  jpg/email.png" class="icon">
                <span>info@company.com</span>
            </div>
            <div class="contact-item">

                <img src="  jpg/location.png" class="icon">
                <span>123 Đường ABC, Quận XYZ, TP.HCM</span>
            </div>

        </div>
        <div class="header-right" style="margin-top: 10px">

            <a href="login.html" class="btn"><h3>Đăng nhập</h3></a>
            <a href="register.html" class="btn"><h3>Đăng ký</h3></a>
            <a href="post-status.html" class="btn"><h3>Đăng tin</h3></a>
        </div>
        <a href="#" class="floating-cart" id="floating-cart" onclick="toggleMiniCart()"
           style="border: 1px solid #ccc; border-radius:100%;">
            <img src="  jpg/heart%20(1).png" style="width: 30px!important; height: 30px !important;" alt="Giỏ hàng"
                 class="cart-icon">
            <div class="item-count">0</div>
            <div class="mini-cart">
                <h4>Bất động sản đã lưu</h4>
                <ul id="cart-items"></ul>
                <button id="go-to-cart" onclick="goToCart()">Đi tới xem bất động sản đã lưu</button>
            </div>
        </a>

    </div>
    <div class="menu">
        <div class="header-bottom" style="height:60px;margin-top: 0; border-bottom: 1px solid black">

            <div class="store-name">
                <h1><a href="homes">
                    <span class="color1">HOME</span>
                    <span class="color2">LANDER</span> <!-- Đổi từ VINA BOOK sang VINA BĐS -->
                </a></h1>
            </div>


            <nav>
                <ul>
                    <li><a href="forsale">Nhà Đất Bán</a>
                    </li>
                    <li><a href="forrent">Nhà Đất Cho Thuê</a></li>
                    <li><a href="Project">Dự Án</a></li>
                    <li><a href="news.jsp">Tin Tức</a></li>
                    <li><a href="wiki.jsp">Wiki BĐS</a></li>
                </ul>
            </nav>


            <div class="contact-info">
                <img src="jpg/phone-call.png" alt="Phone Icon" class="phone-icon">
                <span class="phone-number">0123 456 789</span>
            </div>

        </div>
    </div>


</header>
<div class="main-content" style="text-align: center;width: 60%;margin-top: 30px;margin-left: 20% ">
    <h1>
        Tin tức bất động sản mới nhất</h1>
    <p>Thông tin mới, đầy đủ, hấp dẫn về thị trường bất động sản Việt Nam thông qua dữ liệu lớn về giá, giao dịch, nguồn
        cung - cầu và khảo sát thực tế của đội ngũ phóng viên, biên tập của Batdongsan.com.vn.</p>
</div>


<div class="news-container">
    <!-- Main Featured News -->
    <div class="main-news">
        <img src="jpg/DongNai.jpg" alt="Main News Image" class="main-news-image">
        <div class="main-news-content">
            <p class="date">28/10/2024 08:03 • Tin tức</p>
            <h2 class="main-news-title">M&A Bất Động Sản Đang Diễn Biến Sôi Động Trong Năm 2024</h2>
            <p class="main-news-description">
                Thị trường bất động sản Việt Nam trong 9 tháng đầu năm 2024 chứng kiến sự bùng nổ mạnh mẽ của hoạt động
                M&A bất động sản...
            </p>
        </div>
    </div>

    <!-- Side News Articles -->
    <div class="side-news">
        <h3>Bài viết mới nhất</h3>
        <ul class="side-news-list">
            <li><a href="#">Đất Nền Vành Đai 4 “Nổi Sóng” Cuối Năm 2024</a></li>
            <li><a href="#">Căn Hộ Nhật Bản Đa Phong Cách TT AVIO - Lối Sống Đẳng Cấp, Hiện Đại</a></li>
            <li><a href="#">Eurowindow River Park - Cơ Hội Vàng Để Sở Hữu Căn Hộ Chung Cư Đáng Sống Tại Hà Nội</a></li>
        </ul>
    </div>

    <!-- Most Viewed Articles -->
    <div class="most-viewed">
        <h3>Bài viết được xem nhiều nhất</h3>
        <ol class="most-viewed-list">
            <li><a href="#">Trọn Bộ Lãi Suất Vay Mua Nhà Mới Nhất Tháng 10/2024</a></li>
            <li><a href="#">Thị Trường BĐS Tháng 9/2024: Giảm Mạnh Lượt Tìm Kiếm Do Báo Yagi?</a></li>
            <li><a href="#">Thị Trường BĐS TP.HCM Tháng 7/2024: Khởi Sắc Trở Lại</a></li>
        </ol>
    </div>
</div>
<div class="articles-container">
    <!-- Article Item 1 -->
    <div class="article-item">
        <div class="article-image">
            <img src="  jpg/DaNang.jpg" alt="Article Image">
            <div class="tag">TIN TỨC</div>
        </div>
        <div class="article-content">
            <p class="date">25/10/2024 15:48 • Hải Âu</p>
            <h2 class="article-title">Thị Trường BĐS Tháng 9/2024: Giảm Mạnh Lượt Tìm Kiếm Do Báo Yagi?</h2>
            <p class="article-description">
                Những thông tin mới nhất về thị trường bất động sản tháng 9/2024 từ dữ liệu thị trường của
                Batdongsan.com.vn: giá bán, nguồn cung và mức độ quan tâm tìm kiếm...
            </p>
            <div class="tags">
                <span>Báo cáo thị trường Batdongsan.com.vn</span>
                <span>Diễn biến thị trường BĐS 2024</span>
            </div>
        </div>
    </div>

    <!-- Article Item 2 -->
    <div class="article-item">
        <div class="article-image">
            <img src="jpg/binhduong.jpg" alt="Article Image">
            <div class="tag">TIN TỨC</div>
        </div>
        <div class="article-content">
            <p class="date">25/10/2024 14:01 • Nguyễn Nam</p>
            <h2 class="article-title">Bất Động Sản Phía Nam Là Điểm Đến Hấp Dẫn Của Các Nhà Đầu Tư Hà Nội</h2>
            <p class="article-description">
                Việc căn hộ chung cư Hà Nội tăng giá “chóng mặt” trong thời gian qua đã khiến giới đầu tư tại chính thị
                trường này có tâm lý “e ngại”...
            </p>
            <div class="tags">
                <span>Bất động sản TP.HCM</span>
            </div>
        </div>
    </div>

    <!-- Article Item 3 -->
    <div class="article-item">
        <div class="article-image">
            <img src="jpg/DongNai.jpg" alt="Article Image">
            <div class="tag">TIN TỨC</div>
        </div>
        <div class="article-content">
            <p class="date">24/10/2024 10:15 • Hải Âu</p>
            <h2 class="article-title">Vân Đồn - Tâm Điểm Bất Động Sản Nghỉ Dưỡng Kết Nối Giao Thương Quốc Tế</h2>
            <p class="article-description">
                Nằm cạnh thị trường Trung Quốc rộng lớn, với cảnh quan thiên nhiên tuyệt đẹp, hạ tầng giao thông hiện
                đại gồm sân bay, cao tốc, đường thủy, càng biển...
            </p>
            <div class="tags">
                <span>Bất động sản Vân Đồn</span>
            </div>
        </div>
    </div>
    <div class="article-item">
        <div class="article-image">
            <img src="jpg/DaNang.jpg" alt="Article Image">
            <div class="tag">TIN TỨC</div>
        </div>
        <div class="article-content">
            <p class="date">25/10/2024 15:48 • Hải Âu</p>
            <h2 class="article-title">Thị Trường BĐS Tháng 9/2024: Giảm Mạnh Lượt Tìm Kiếm Do Báo Yagi?</h2>
            <p class="article-description">
                Những thông tin mới nhất về thị trường bất động sản tháng 9/2024 từ dữ liệu thị trường của
                Batdongsan.com.vn: giá bán, nguồn cung và mức độ quan tâm tìm kiếm...
            </p>
            <div class="tags">
                <span>Báo cáo thị trường Batdongsan.com.vn</span>
                <span>Diễn biến thị trường BĐS 2024</span>
            </div>
        </div>
    </div>

    <!-- Article Item 2 -->
    <div class="article-item">
        <div class="article-image">
            <img src="jpg/binhduong.jpg" alt="Article Image">
            <div class="tag">TIN TỨC</div>
        </div>
        <div class="article-content">
            <p class="date">25/10/2024 14:01 • Nguyễn Nam</p>
            <h2 class="article-title">Bất Động Sản Phía Nam Là Điểm Đến Hấp Dẫn Của Các Nhà Đầu Tư Hà Nội</h2>
            <p class="article-description">
                Việc căn hộ chung cư Hà Nội tăng giá “chóng mặt” trong thời gian qua đã khiến giới đầu tư tại chính thị
                trường này có tâm lý “e ngại”...
            </p>
            <div class="tags">
                <span>Bất động sản TP.HCM</span>
            </div>
        </div>
    </div>

    <!-- Article Item 3 -->
    <div class="article-item">
        <div class="article-image">
            <img src="jpg/DongNai.jpg" alt="Article Image">
            <div class="tag">TIN TỨC</div>
        </div>
        <div class="article-content">
            <p class="date">24/10/2024 10:15 • Hải Âu</p>
            <h2 class="article-title">Vân Đồn - Tâm Điểm Bất Động Sản Nghỉ Dưỡng Kết Nối Giao Thương Quốc Tế</h2>
            <p class="article-description">
                Nằm cạnh thị trường Trung Quốc rộng lớn, với cảnh quan thiên nhiên tuyệt đẹp, hạ tầng giao thông hiện
                đại gồm sân bay, cao tốc, đường thủy, càng biển...
            </p>
            <div class="tags">
                <span>Bất động sản Vân Đồn</span>
            </div>
        </div>
    </div>
    <div class="article-item">
        <div class="article-image">
            <img src="jpg/DaNang.jpg" alt="Article Image">
            <div class="tag">TIN TỨC</div>
        </div>
        <div class="article-content">
            <p class="date">25/10/2024 15:48 • Hải Âu</p>
            <h2 class="article-title">Thị Trường BĐS Tháng 9/2024: Giảm Mạnh Lượt Tìm Kiếm Do Báo Yagi?</h2>
            <p class="article-description">
                Những thông tin mới nhất về thị trường bất động sản tháng 9/2024 từ dữ liệu thị trường của
                Batdongsan.com.vn: giá bán, nguồn cung và mức độ quan tâm tìm kiếm...
            </p>
            <div class="tags">
                <span>Báo cáo thị trường Batdongsan.com.vn</span>
                <span>Diễn biến thị trường BĐS 2024</span>
            </div>
        </div>
    </div>

    <!-- Article Item 2 -->
    <div class="article-item">
        <div class="article-image">
            <img src="jpg/binhduong.jpg" alt="Article Image">
            <div class="tag">TIN TỨC</div>
        </div>
        <div class="article-content">
            <p class="date">25/10/2024 14:01 • Nguyễn Nam</p>
            <h2 class="article-title">Bất Động Sản Phía Nam Là Điểm Đến Hấp Dẫn Của Các Nhà Đầu Tư Hà Nội</h2>
            <p class="article-description">
                Việc căn hộ chung cư Hà Nội tăng giá “chóng mặt” trong thời gian qua đã khiến giới đầu tư tại chính thị
                trường này có tâm lý “e ngại”...
            </p>
            <div class="tags">
                <span>Bất động sản TP.HCM</span>
            </div>
        </div>
    </div>

    <!-- Article Item 3 -->
    <div class="article-item">
        <div class="article-image">
            <img src="jpg/DongNai.jpg" alt="Article Image">
            <div class="tag">TIN TỨC</div>
        </div>
        <div class="article-content">
            <p class="date">24/10/2024 10:15 • Hải Âu</p>
            <h2 class="article-title">Vân Đồn - Tâm Điểm Bất Động Sản Nghỉ Dưỡng Kết Nối Giao Thương Quốc Tế</h2>
            <p class="article-description">
                Nằm cạnh thị trường Trung Quốc rộng lớn, với cảnh quan thiên nhiên tuyệt đẹp, hạ tầng giao thông hiện
                đại gồm sân bay, cao tốc, đường thủy, càng biển...
            </p>
            <div class="tags">
                <span>Bất động sản Vân Đồn</span>
            </div>
        </div>
    </div>
    <div class="article-item">
        <div class="article-image">
            <img src="jpg/DaNang.jpg" alt="Article Image">
            <div class="tag">TIN TỨC</div>
        </div>
        <div class="article-content">
            <p class="date">25/10/2024 15:48 • Hải Âu</p>
            <h2 class="article-title">Thị Trường BĐS Tháng 9/2024: Giảm Mạnh Lượt Tìm Kiếm Do Báo Yagi?</h2>
            <p class="article-description">
                Những thông tin mới nhất về thị trường bất động sản tháng 9/2024 từ dữ liệu thị trường của
                Batdongsan.com.vn: giá bán, nguồn cung và mức độ quan tâm tìm kiếm...
            </p>
            <div class="tags">
                <span>Báo cáo thị trường Batdongsan.com.vn</span>
                <span>Diễn biến thị trường BĐS 2024</span>
            </div>
        </div>
    </div>

    <!-- Article Item 2 -->
    <div class="article-item">
        <div class="article-image">
            <img src="jpg/binhduong.jpg" alt="Article Image">
            <div class="tag">TIN TỨC</div>
        </div>
        <div class="article-content">
            <p class="date">25/10/2024 14:01 • Nguyễn Nam</p>
            <h2 class="article-title">Bất Động Sản Phía Nam Là Điểm Đến Hấp Dẫn Của Các Nhà Đầu Tư Hà Nội</h2>
            <p class="article-description">
                Việc căn hộ chung cư Hà Nội tăng giá “chóng mặt” trong thời gian qua đã khiến giới đầu tư tại chính thị
                trường này có tâm lý “e ngại”...
            </p>
            <div class="tags">
                <span>Bất động sản TP.HCM</span>
            </div>
        </div>
    </div>

    <!-- Article Item 3 -->
    <div class="article-item">
        <div class="article-image">
            <img src="jpg/DongNai.jpg" alt="Article Image">
            <div class="tag">TIN TỨC</div>
        </div>
        <div class="article-content">
            <p class="date">24/10/2024 10:15 • Hải Âu</p>
            <h2 class="article-title">Vân Đồn - Tâm Điểm Bất Động Sản Nghỉ Dưỡng Kết Nối Giao Thương Quốc Tế</h2>
            <p class="article-description">
                Nằm cạnh thị trường Trung Quốc rộng lớn, với cảnh quan thiên nhiên tuyệt đẹp, hạ tầng giao thông hiện
                đại gồm sân bay, cao tốc, đường thủy, càng biển...
            </p>
            <div class="tags">
                <span>Bất động sản Vân Đồn</span>
            </div>
        </div>
    </div>
    <div class="articles-container">
        <!-- Existing article items go here... -->

        <!-- "See More News" Button -->
        <div class="see-more">
            <button onclick="loadMoreNews()">Xem Thêm Tin Tức</button>
        </div>
    </div>
    <script>
        function loadMoreNews() {
            // This is just an example. Replace with actual code to load articles dynamically.
            alert("Loading more news articles...");

            // If you're loading content via AJAX, you would replace this alert with an AJAX call to fetch more articles
        }
    </script>

</div>




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