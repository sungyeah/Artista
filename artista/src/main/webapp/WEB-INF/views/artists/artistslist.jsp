<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<style>
/* 여기부터 아티스트 목록 */
.artist-list {
    position: relative;
    max-width: 1200px;
    min-height: 580px;
    margin: 0 auto 144px;
    padding: 0 15px;
}
.artist-list ul {
    overflow: hidden;
    width: 47.333333333333333%;
    column-count: 2;
}
</style>
<body>
<%@include file ="../header.jsp" %>
            <div id="container" style="padding-top: 100px;">
			
        <!-- Content -->
        <article id="content" class="vuelayer">
            <div class="artist-list">
                
                <ul>
                    <!-- <li><a href="artistdetail.html" data-image="img/">Ayoung Kim </a></li> -->
                    <%--
                    <c:forEach items="${artistList }" var="artist">
                    	<li><a href="artistdetail/artist.artistno" data-image="${artist.artistImg}">${artist.artistName } </a></li>
                    </c:forEach>
                     --%>
                    <li><a class="list" href="artistdetail" data-image="메인사진2.jpg">Bernar Venet </a></li>
                    <li><a class="list" href="/artist/view/20000000121" data-image="/public/2020/09/4/15/14/36/6be6a72e-c1d6-4e09-8855-5be477fb0e76.resize_large.jpg">Choi Minhwa </a></li>
                    <li><a class="list" href="/artist/view/20000000112" data-image="/public/2020/03/31/15/4/46/d32e26f9-39f8-483a-8804-13121a180b62.resize_large.jpg">Chung Sang-Hwa</a></li>
                    <li><a href="/artist/view/20000000111" data-image="/public/2020/04/4/10/38/3/95acec03-42f6-4b15-bebb-943c8d82e1bb.resize_large.jpg">Chung Zuyoung </a></li>
                    <li><a href="/artist/view/20000000109" data-image="/public/2020/03/31/15/8/22/2ca4ee09-83a8-40e5-b512-e2f0e2f83ccd.resize_large.jpg">Fred Sandback </a></li>
                    <li><a href="/artist/view/20000000105" data-image="/public/2020/03/31/15/13/8/3bb65f0e-a90a-4133-85cc-58856ea88d62.resize_large.jpg">Ik-Joong Kang </a></li>
                    <li><a href="/artist/view/20000000108" data-image="/public/2020/04/8/18/45/51/a3107fcc-f822-402f-85d1-b566f02d131a.resize_large.jpg">Iván Navarro</a></li>
                    <li><a href="/artist/view/20000000107" data-image="/public/2020/03/31/10/55/19/059219c6-4770-4c20-a9e5-8b5390ce9dbe.resize_large.jpg">Jeon Joonho</a></li>
                    <li><a href="/artist/view/20000000106" data-image="/public/2021/04/29/21/40/27/fdb0d1c9-9b4f-4172-8df1-65237c0bb7a8.resize_large.jpg">John Pai</a></li>
                    <li><a href="/artist/view/20000000115" data-image="/public/2020/07/3/13/40/54/b1a02028-95df-43a5-acd7-3585a5a70556.resize_large.jpg">Kang Seung Lee</a></li>
                    <li><a href="/artist/view/20000000104" data-image="/public/2020/03/31/15/31/10/4513a98e-1e79-4922-a704-b2112a539ef5.resize_large.jpg">Kim Guiline</a></li>
                    <li><a href="/artist/view/20000000103" data-image="/public/2020/03/31/11/3/4/a4252c68-393e-46d9-a05c-66d09d460a67.resize_large.jpg">Kim Sung Yoon</a></li>
                    <li><a href="/artist/view/20000000102" data-image="/public/2020/04/8/18/42/19/8009febd-b687-4c6c-90e0-c4c4051f50f9.resize_large.jpg">Kim Tschang-Yeul Estate</a></li>
                    <li><a href="/artist/view/20000000101" data-image="/public/2020/03/31/15/34/29/0ecdc027-c590-4ee5-bf32-7e1e35a0a56a.resize_large.jpg">Kwak Duck-Jun</a></li>
                    <li><a href="/artist/view/20000000100" data-image="/public/2020/04/8/18/41/7/3e780a1f-b802-4315-9106-990fb64d4135.resize_large.jpg">Lee Kang-So</a></li>
                    <li><a href="/artist/view/20000000099" data-image="/public/2020/03/31/15/0/45/7d17ad64-f9ea-4c41-8d79-94b437586e87.resize_large.jpg">Lee Kun-Yong</a></li>
                    <li><a href="/artist/view/20000000084" data-image="/public/2020/03/31/16/22/20/d6a9982d-b45d-4d0f-98fa-408661dd0b7c.resize_large.jpg">Lee Seung Jio Estate </a></li>
                    <li><a href="/artist/view/20000000097" data-image="/public/2020/03/31/16/2/31/edba9b2f-2376-4e87-84a8-181dea332863.resize_large.jpg">Lee Ufan</a></li>
                    <li><a href="/artist/view/20000000096" data-image="/public/2020/04/4/10/49/53/ed49af28-7248-4f5f-a716-fa11ce5ad361.resize_large.jpg">Lee Yoon-jean </a></li>
                    <li><a href="/artist/view/20000000095" data-image="/public/2020/04/8/18/48/53/5fbc1e58-e518-400f-8ffe-429ac9b1bc3a.resize_large.jpg">Michael Craig-Martin </a></li>
                    <li><a href="/artist/view/20000000094" data-image="/public/2020/04/15/15/18/56/ca774073-b160-40ad-8e65-0f8ee46d2f0f.resize_large.jpg">Minjung Kim </a></li>
                    <li><a href="/artist/view/20000000093" data-image="/public/2020/04/8/18/58/59/e7d35166-4755-44f4-81f9-7d4d934a94b8.resize_large.jpg">Moon Kyungwon </a></li>
                    <li><a href="/artist/view/20000000092" data-image="/public/2020/05/9/16/12/4/93244864-1902-4127-90b9-009737b5db1c.resize_large.jpg">Moon Kyungwon &amp; Jeon Joonho </a></li>
                    <li><a href="/artist/view/20000000091" data-image="/public/2020/04/4/10/41/42/1f3a96c9-adf0-48a1-b017-188476212416.resize_large.jpg">Myoung Ho Lee</a></li>
                    <li><a href="/artist/view/20000000083" data-image="/public/2020/03/31/16/23/44/ad7e64b3-164f-4e9f-ba10-c08add8429e7.resize_large.jpg">Park Hyunki Estate</a></li>
                    <li><a href="/artist/view/20000000090" data-image="/public/2020/04/4/10/42/55/d1c115bb-1777-457b-8146-16fe084b7ce8.resize_large.jpg">Park Minjoon </a></li>
                    <li><a href="/artist/view/20000000089" data-image="/public/2020/03/31/16/4/38/95811d2b-c062-4b59-ab76-a1e7b422608e.resize_large.jpg">Quac Insik</a></li>
                    <li><a href="/artist/view/20000000088" data-image="/public/2020/03/31/16/5/55/9200d2d0-fe52-40c6-9a74-71b124056a3e.resize_large.jpg">Robert Indiana</a></li>
                    <li><a href="/artist/view/20000000087" data-image="/public/2020/03/31/16/7/24/ee382278-0bcd-4d7b-a302-8353651f7986.resize_large.jpg">Ryan Gander</a></li>
                    <li><a href="/artist/view/20000000123" data-image="/public/2022/03/5/18/19/13/23b8be9e-5d7d-4d11-8e63-66ea33f84a92.resize_large.jpg">Sabine Moritz</a></li>
                    <li><a href="/artist/view/20000000086" data-image="/public/2020/04/4/10/44/51/fb1c4998-b946-477d-bfbb-4e61530c426e.resize_large.jpg">Seulgi Lee</a></li>
                    <li><a href="/artist/view/20000000098" data-image="/public/2020/06/2/16/31/50/cfe90c4a-4b95-4fb8-ab20-705c7d26b656.resize_large.jpg">Seung-taek Lee </a></li>
                    <li><a href="/artist/view/20000000082" data-image="/public/2020/03/31/15/6/50/34e0907f-1afd-442f-a5e4-445eac7702b1.resize_large.jpg">Shin Sung Hy Estate</a></li>
                    <li><a href="/artist/view/20000000085" data-image="/public/2020/03/31/16/21/32/ff50e1b9-dbe7-4791-a1c0-89c7d2d540a0.resize_large.jpg">Suh Se Ok</a></li>
                    <li><a href="/artist/view/20000000081" data-image="/public/2019/12/3/0/36/27/e11b6d67-b3a0-4ec4-a334-d73891117a55.resize_large.jpg">Thomas Struth </a></li>
                    <li><a href="/artist/view/20000000080" data-image="/public/2020/03/31/16/26/22/d760784e-ac9e-440d-8371-9abb5dcd993b.resize_large.jpg">Tomás Saraceno</a></li>
                    <li><a href="/artist/view/20000000079" data-image="/public/2020/04/4/10/48/42/63ec893a-115a-48d3-9ddd-a46d6ba606b4.resize_large.jpg">Yang Jung Uk</a></li>
                    <li><a href="/artist/view/20000000077" data-image="/public/2020/03/31/16/27/21/97ed52cc-0090-40dd-8cf2-f7ccac440901.resize_large.jpg">Yoo Geun-Taek </a></li>
                    <li><a href="/artist/view/20000000076" data-image="/public/2022/01/29/11/13/15/b0a7ab7c-5af8-4b90-92b6-fd3bb8236dcd.resize_large.jpg">Yun-Hee Toh</a></li>
                </ul>
            </div>
        </article>
        
    
</div>
<%@include file ="../footer.jsp" %>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
    $('.list').mouseenter(function(e){
    	let imagePath = e.currentTarget.dataset.image;
        var html="<figure class='landscape'><div class='portrait'><img src='images/" + imagePath + "'></div></figure>"
        $('.artist-list').append(html);
       
    });
    $('.list').mouseleave(function(){
         $('.landscape').remove(); 
    });
</script>
</body>
</html>