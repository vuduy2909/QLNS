from collections import OrderedDict
from rest_framework.response import Response

from core.pagination import CustomLimitOffsetPagination


class NotificationPagination(CustomLimitOffsetPagination):
	def get_paginated_response(self, data, queryset):
		return Response(OrderedDict([
			('count', self.count),
			('next', self.get_next_link()),
			('previous', self.get_previous_link()),
			('results', data),
			('unread_count', queryset.filter(read=False).count())
		]))