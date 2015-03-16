<%@ page pageEncoding="UTF-8"%>
	<div class="modal fade" id="delModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						<span class="glyphicon glyphicon-warning-sign"
							style="color: #cc0000;"> 删除确认</span>
					</h4>
				</div>
				<div class="modal-body">
					<h5>删除后不可恢复，您确定删除吗？</h5>
				</div>
				<div class="modal-footer">
					<button type="button" id="doDel" class="btn btn-primary">确认</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>