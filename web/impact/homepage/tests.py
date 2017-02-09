from django.test import TestCase

class TestHomepage(TestCase):

    def test_fail(self):
        assert(False)

    def test_homepage(self):
        response = self.client.get('/')
        self.assertEqual(response.status_code, 200)

