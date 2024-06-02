<div class="single_post_content">
    <h2><span>राजनीति</span></h2>
    <div class="single_post_content_left">
        <ul class="business_catgnav  wow fadeInDown">
            <?php
                $count = 0;

                $viralPostTitleResult = $admin->getViralPost(10);

                while($row = $admin->fetcharray($viralPostTitleResult)) {
                    
                    $count++;

                    $rowId = $row['id'];
                    $imageURL = $row['large_image_url'];
                    $newsTitle = $row['title'];
                    $newsDiscription = $row['description'];

                    if($count == 1){
                ?>
            <li>
                <figure class="bsbig_fig">
                    <a href="<?php echo $rowId ?>" class="featured_img">
                        <img class="img-center" alt="" src="<?=URL?>/assets/images/<?php echo  $imageURL ?>">
                        <span class="overlay"></span>
                    </a>

                    <figcaption>
                        <a href="<?php echo $rowId ?>"><?php echo $newsTitle ?></a>
                    </figcaption>

                    <p><?php echo $newsDiscription ?></p>
                </figure>
            </li>
            <?php
                }
            }
        ?>
        </ul>
    </div>
    <div class="single_post_content_right">
        <ul class="spost_nav">
            <?php
                $viralPostResult = $admin->getViralPost(10);

                while($row = $admin->fetcharray($viralPostResult)) {
                    $rowId = $row['id'];
                    $imageURL = $row['large_image_url'];
                    $newsTitle = $row['title'];

            ?>

            <li>
                <div class="media">
                    <a href="<?php echo $rowId ?>" class="media-left">
                        <img src="<?=URL?>/assets/images/<?php echo $imageURL ?>" alt="">
                    </a>
                    <div class="media-body">
                        <a href="<?php echo $row['id'] ?>" class="catg_title">
                            <?php echo $newsTitle ?>
                        </a>
                    </div>
                </div>
            </li>

            <?php
            }                                        
            ?>
        </ul>
    </div>
</div>