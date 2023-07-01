import { mount } from '@vue/test-utils'
import axios from 'axios'
import Login from '@/pages/login.vue'
// import Users from './users'

describe('HelloWorld', () => {
  test('display Hello World',async () => {
    const wrapper = shallowMount(inputParent)
    await wrapper
      .findComponent(inputChildWithArgument)
      .vm.$emit('childEmitWithArgument', 'test')
    expect(wrapper.vm.$data.testData).toEqual('test')


    const button = wrapper.find('button')
    await button.trigger('click')
  })
})

