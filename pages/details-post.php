<!DOCTYPE html>
<html>

<?php
    require_once '../include/common.php';
    require_once './header.php';    
?>

<body>
    <div id="preloader">
        <div id="status">&nbsp;</div>
    </div>

    <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>

    <div class="container">
        <header id="header">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="header_top">
                        <div class="header_top_left">
                            <ul class="top_nav">
                                <li><a href="home">Home</a></li>
                                <li><a href="#">About</a></li>
                                <li><a href="contact.html">Contact</a></li>
                            </ul>
                        </div>
                        <div class="header_top_right">
                            <p id="pcurrentDate">Friday, December 05, 2045</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="header_bottom">
                        <div class="logo_area"><a href="home" class="logo"><img src="<?=URL?>/assets/images/logo.jpg"
                                    alt=""></a>
                        </div>
                        <div class="add_banner"><a href="#"><img src="<?=URL?>/assets/images/addbanner_728x90_V1.jpg"
                                    alt=""></a>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <?php include 'menu.php'; ?>

        <?php include 'latest-news.php'; ?>

        <section id="contentSection">
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-8">
                    <div class="left_content">
                        <div class="single_page">

                            <?php $admin->getPostDetails(); ?>

                            <div class="social_link">
                                <ul class="sociallink_nav">
                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                </ul>
                            </div>
                            <div class="related_post">
                                <h2>Related Post <i class="fa fa-thumbs-o-up"></i></h2>
                                <ul class="spost_nav wow fadeInDown animated">
                                    <li>
                                        <div class="media"> <a class="media-left" href="single_page.html"> <img
                                                    src="<?=URL?>/assets/images/post_img1.jpg" alt=""> </a>
                                            <div class="media-body"> <a class="catg_title" href="single_page.html">
                                                    Aliquam malesuada diam eget turpis varius</a> </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="media"> <a class="media-left" href="single_page.html"> <img
                                                    src="<?=URL?>/assets/images/post_img2.jpg" alt=""> </a>
                                            <div class="media-body"> <a class="catg_title" href="single_page.html">
                                                    Aliquam malesuada diam eget turpis varius</a> </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="media"> <a class="media-left" href="single_page.html"> <img
                                                    src="<?=URL?>/assets/images/post_img1.jpg" alt=""> </a>
                                            <div class="media-body"> <a class="catg_title" href="single_page.html">
                                                    Aliquam malesuada diam eget turpis varius</a> </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <nav class="nav-slit"> <a class="prev" href="#"> <span class="icon-wrap"><i
                                class="fa fa-angle-left"></i></span>
                        <div>
                            <h3>City Lights</h3>
                            <img src="<?=URL?>/assets/images/post_img1.jpg" alt="" />
                        </div>
                    </a> <a class="next" href="#"> <span class="icon-wrap"><i class="fa fa-angle-right"></i></span>
                        <div>
                            <h3>Street Hills</h3>
                            <img src="<?=URL?>/assets/images/post_img1.jpg" alt="" />
                        </div>
                    </a> </nav>
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <aside class="right_content">
                        <div class="single_sidebar">
                            <h2><span>Popular Post</span></h2>
                            <ul class="spost_nav">
                                <li>
                                    <div class="media wow fadeInDown"> <a href="single_page.html" class="media-left">
                                            <img alt="" src="<?=URL?>/assets/images/post_img1.jpg"> </a>
                                        <div class="media-body"> <a href="single_page.html" class="catg_title"> Aliquam
                                                malesuada diam eget turpis varius 1</a> </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="media wow fadeInDown"> <a href="single_page.html" class="media-left">
                                            <img alt="" src="<?=URL?>/assets/images/post_img2.jpg"> </a>
                                        <div class="media-body"> <a href="single_page.html" class="catg_title"> Aliquam
                                                malesuada diam eget turpis varius 2</a> </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="media wow fadeInDown"> <a href="single_page.html" class="media-left">
                                            <img alt="" src="<?=URL?>/assets/images/post_img1.jpg"> </a>
                                        <div class="media-body"> <a href="single_page.html" class="catg_title"> Aliquam
                                                malesuada diam eget turpis varius 3</a> </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="media wow fadeInDown"> <a href="single_page.html" class="media-left">
                                            <img alt="" src="<?=URL?>/assets/images/post_img2.jpg"> </a>
                                        <div class="media-body"> <a href="single_page.html" class="catg_title"> Aliquam
                                                malesuada diam eget turpis varius 4</a> </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="single_sidebar">
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#category" aria-controls="home"
                                        role="tab" data-toggle="tab">Category</a></li>
                                <li role="presentation"><a href="#video" aria-controls="profile" role="tab"
                                        data-toggle="tab">Video</a></li>
                                <li role="presentation"><a href="#comments" aria-controls="messages" role="tab"
                                        data-toggle="tab">Comments</a></li>
                            </ul>
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="category">
                                    <ul>
                                        <li class="cat-item"><a href="#">Sports</a></li>
                                        <li class="cat-item"><a href="#">Fashion</a></li>
                                        <li class="cat-item"><a href="#">Business</a></li>
                                        <li class="cat-item"><a href="#">Technology</a></li>
                                        <li class="cat-item"><a href="#">Games</a></li>
                                        <li class="cat-item"><a href="#">Life &amp; Style</a></li>
                                        <li class="cat-item"><a href="#">Photography</a></li>
                                    </ul>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="video">
                                    <div class="vide_area">
                                        <iframe width="100%" height="250"
                                            src="http://www.youtube.com/embed/h5QWbURNEpA?feature=player_detailpage"
                                            frameborder="0" allowfullscreen></iframe>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="comments">
                                    <ul class="spost_nav">
                                        <li>
                                            <div class="media wow fadeInDown"> <a href="single_page.html"
                                                    class="media-left"> <img alt=""
                                                        src="<?=URL?>/assets/images/post_img1.jpg"> </a>
                                                <div class="media-body"> <a href="single_page.html" class="catg_title">
                                                        Aliquam malesuada diam eget turpis varius 1</a> </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="media wow fadeInDown"> <a href="single_page.html"
                                                    class="media-left"> <img alt=""
                                                        src="<?=URL?>/assets/images/post_img2.jpg"> </a>
                                                <div class="media-body"> <a href="single_page.html" class="catg_title">
                                                        Aliquam malesuada diam eget turpis varius 2</a> </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="media wow fadeInDown"> <a href="single_page.html"
                                                    class="media-left"> <img alt=""
                                                        src="<?=URL?>/assets/images/post_img1.jpg"> </a>
                                                <div class="media-body"> <a href="single_page.html" class="catg_title">
                                                        Aliquam malesuada diam eget turpis varius 3</a> </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="media wow fadeInDown"> <a href="single_page.html"
                                                    class="media-left"> <img alt=""
                                                        src="<?=URL?>/assets/images/post_img2.jpg"> </a>
                                                <div class="media-body"> <a href="single_page.html" class="catg_title">
                                                        Aliquam malesuada diam eget turpis varius 4</a> </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="single_sidebar wow fadeInDown">
                            <h2><span>Sponsor</span></h2>
                            <a class="sideAdd" href="#"><img src="<?=URL?>/assets/images/add_img.jpg" alt=""></a>
                        </div>
                        <div class="single_sidebar wow fadeInDown">
                            <h2><span>Category Archive</span></h2>
                            <select class="catgArchive">
                                <option>Select Category</option>
                                <option>Life styles</option>
                                <option>Sports</option>
                                <option>Technology</option>
                                <option>Treads</option>
                            </select>
                        </div>
                        <div class="single_sidebar wow fadeInDown">
                            <h2><span>Links</span></h2>
                            <ul>
                                <li><a href="#">Blog</a></li>
                                <li><a href="#">Rss Feed</a></li>
                                <li><a href="#">Login</a></li>
                                <li><a href="#">Life &amp; Style</a></li>
                            </ul>
                        </div>
                    </aside>
                </div>
            </div>
        </section>

        <?php include './footer.php' ?>
</body>

</html>