from django.contrib import admin


class TimestampedModelAdmin(admin.ModelAdmin):
    exclude = ('deleted_at',)
    readonly_fields = ('created_at', 'modified_at',)


class TimestampedModelStackedInline(admin.StackedInline):
    exclude = ('deleted_at', 'created_at', 'modified_at',)
