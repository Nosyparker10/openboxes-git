package org.pih.warehouse.shipping

import grails.testing.web.controllers.ControllerUnitTest
import org.junit.Ignore
import org.pih.warehouse.MessageTagLib
import org.pih.warehouse.shipping.Container
import org.pih.warehouse.shipping.Shipment
import org.pih.warehouse.shipping.ShipmentController
import org.pih.warehouse.shipping.ShipmentService

@Ignore
class ShipmentControllerTests  implements ControllerUnitTest {

    def shipmentServiceMock

//    @Override
    Class getControllerClass() {
        return ShipmentController;
    }

    protected void setUp() {
        super.setUp()
        shipmentServiceMock = mockFor(ShipmentService)

        def stubMessageTagLib = new Expando()
        stubMessageTagLib.message = { params -> return "fake message" }
        controller.metaClass.warehouse = stubMessageTagLib;
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testAddToShipmentUnpackedItemContainerShouldRedirectToCreateShipmentFlow() {

        def shipmentId = 'SHIP001'
        mockDomain(Shipment, [new Shipment(id : shipmentId)])
        mockDomain(Container)
        mockCommandObject(ItemListCommand)

        ItemListCommand commands = new ItemListCommand()
        commands.items = [new ItemCommand()]

        shipmentServiceMock.demand.addToShipment { true }
        controller.shipmentService = shipmentServiceMock.createMock()

        controller.params.shipmentContainerKey = "$shipmentId:0"
        controller.addToShipmentPost(commands)

        assertEquals "createShipmentWorkflow", redirectArgs.controller
        assertEquals "createShipment", redirectArgs.action
    }

    void testAddToShipmentPackingListContainerShouldRedirectToCreateShipmentFlow() {

        def shipmentId = 'SHIP001'
        def containerId = 'CONT001'
        mockDomain(Shipment, [new Shipment(id : shipmentId)])
        mockDomain(Container, [new Container(id : containerId)])
        mockCommandObject(ItemListCommand)

        ItemListCommand commands = new ItemListCommand()
        commands.items = [new ItemCommand()]

        shipmentServiceMock.demand.addToShipment { true }
        controller.shipmentService = shipmentServiceMock.createMock()

        controller.params.shipmentContainerKey = "$shipmentId:$containerId"
        controller.addToShipmentPost(commands)

        assertEquals "createShipmentWorkflow", redirectArgs.controller
        assertEquals "createShipment", redirectArgs.action
    }
}
