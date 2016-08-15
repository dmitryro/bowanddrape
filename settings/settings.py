try:
    #from beta_settings import *
    from development_commerce_settings import *
    #from local_settings import *

except ImportError:
    from default_settings import *
