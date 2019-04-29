Pod::Spec.new do |s|
    s.name             = 'libwebp'
    s.version          = '1.0.2'
    s.summary          = 'Library to encode and decode images in WebP format.'

    s.homepage         = 'http://gitlab.it.taikang.com/TaiLifeiOS/tailife/tailife-podlivemodule.git'
    s.authors          = 'Google Inc.'
    s.license          = { :type => 'BSD', :file => 'COPYING' }
    s.source           = { :git => 'http://gitlab.it.taikang.com/TaiLifeiOS/tailife/tailife-podlivemodule.git', :tag => 'v1.0.2' }
    s.compiler_flags = '-D_THREAD_SAFE'
    s.requires_arc = false

    s.ios.deployment_target = '9.0'
    s.pod_target_xcconfig  = {"USER_HEADER_SEARCH_PATHS" => "$(inherited) ${PODS_ROOT}/libwebp/**"}

    s.subspec 'webp' do |a|
        a.header_dir           = 'webp'
        a.source_files         = 'src/webp/*.h'
    end

    s.subspec 'core' do |a|
        a.source_files         = 'src/utils/*.{h,c}', 'src/dsp/*.{h,c}', 'src/enc/*.{h,c}', 'src/dec/*.{h,c}'
        a.dependency             'libwebp/webp'
    end

    s.subspec 'utils' do |a|
        a.dependency             'libwebp/core'
    end

    s.subspec 'dsp' do |a|
        a.dependency             'libwebp/core'
    end

    s.subspec 'enc' do |a|
        a.dependency             'libwebp/core'
    end

    s.subspec 'dec' do |a|
        a.dependency             'libwebp/core'
    end

    s.subspec 'demux' do |a|
        a.source_files         = 'src/demux/*.{h,c}'
        a.dependency             'libwebp/core'
    end

    s.subspec 'mux' do |a|
        a.source_files         = 'src/mux/*.{h,c}'
        a.dependency             'libwebp/core'
    end


end
