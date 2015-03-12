<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="perterl">
	<div class="perterles">
		<div>
			<p>商品管理</p>
			<ul>
				<li><a href="../proscenium/release">发布新商品</a></li>
				<li><a href="#">自动发货商品管理</a></li>
				<li><a href="../proscenium/storehouseShopComm">仓库中的商品</a></li>
				<li><a href="../proscenium/soldShopComm">出售中的商品</a></li>
				<li><a href="../proscenium/auctionShopComm">拍卖的商品</a></li>
				<li><a href="#">商品促销</a></li>
				<li><a href="#">商品留言回复</a></li>
			</ul>
		</div>
		<div>
			<p>交易管理</p>
			<ul>
				<li><a href="../proscenium/shopTransaction">全部卖出交易</a></li>
				<li><a href="../proscenium/returnGoods">买家退款退货</a></li>
				<li><a href="#">结算管理</a></li>
				<li><a href="../proscenium/shopEvaluation">评价管理</a></li>
				<!-- 				<li><a href="#">交易货款结算<span class="red">(新)</span></a></li> -->
				<!-- 				<li><a href="#">代金卷结算</a></li> -->
			</ul>
		</div>
		<!-- 		<div> -->
		<!-- 			<p>营销管理</p> -->
		<!-- 			<ul> -->
		<!-- 				<li><a href="#">营销管理报名</a></li> -->
		<!-- 				<li><a href="#">营销应用集合</a></li> -->
		<!-- 				<li><a href="#">客户通CRM<span class="red">(新)</span></a></li> -->
		<!-- 			</ul> -->
		<!-- 		</div> -->
		<!-- 		<div> -->
		<!-- 			<p>店铺管理</p> -->
		<!-- 			<ul> -->
		<!-- 				<li><a href="#">查看我的店铺</a></li> -->
		<!-- 				<li><a href="#">子账号管理<span class="red">(新)</span></a></li> -->
		<!-- 				<li><a href="#">店铺管理</a></li> -->
		<!-- 			</ul> -->
		<!-- 		</div> -->
	</div>
</div>
<div class="perterr">
	<div>
		<div class="pertertil">
			<div>
				<dl>
					<dt>
						<img src="../content/static/images/kx.jpg" />
					</dt>
					<dd>
						<b>${shop.shopName }</b><br>
						<img src="../content/static/images/user.jpg" />
					</dd>
					<dd>${shop.createDate }</dd>
				</dl>
				<p>${shop.email }</p>
				<p>${shop.id }</p>
			</div>
			<div>
				<p>可用资金</p>
				<p>
					<b>${shop.money }</b>
				</p>
				<p>
					<a class="onck1" href="#">新增资金</a>
				</p>
			</div>
		</div>
		<div class="pertersgg">
			<h3>公告</h3>
			<ul>
				<li>拍拍网店运营全攻略</li>
				<li>京东快递在拍拍网正式开通</li>
				<li>“拍拍大讲堂”微信账号开通了</li>
			</ul>
		</div>
		<div class="cl"></div>
	</div>