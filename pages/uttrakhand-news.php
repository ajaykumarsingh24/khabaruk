<div class="fashion">
    <div class="single_post_content">
        <h2><span>उत्तराखण्ड</span></h2>
        <ul class="business_catgnav wow fadeInDown">
            <?php
                $count = 0;

                $viralPostTitleResult = $admin->getViralPost(6);

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
                        <img alt="" src="<?=URL?>/assets/images/<?php echo  $imageURL ?>">
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
        <ul class="spost_nav">
            <?php
                $viralPostResult = $admin->getViralPost(6);

                while($row = $admin->fetcharray($viralPostResult)) {
                    $rowId = $row['id'];
                    $imageURL = $row['large_image_url'];
                    $newsTitle = $row['title'];

            ?>

            <li>
                <div class="media wow fadeInDown">
                    <a href="<?php echo $rowId ?>" class="media-left">
                        <img alt="" src="<?=URL?>/assets/images/<?php echo $imageURL ?>">
                    </a>

                    <div class="media-body">
                        <a href="<?php echo $rowId ?>" class="catg_title">
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